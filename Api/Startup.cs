using Api.Core;
using Api.Core.Maps;
using Api.Core.Profiles;
using Application;
using Application.Commands;
using Application.Email;
using Application.Queries;
using EfDataAccess;
using Implementation.Commands.EntityFramework;
using Implementation.Email;
using Implementation.Loggers;
using Implementation.Queries;
using Implementation.Validators;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();

            services.AddAutoMapper(this.GetType().Assembly);
            services.AddAutoMapper(typeof(IUseCase).Assembly);
            //services.AddAutoMapper(typeof(GetProductQuery).Assembly);
            //services.AddAutoMapper(typeof(GetProductsQuery).Assembly);
            services.AddTransient<ShopContext>();
            services.AddTransient<UseCaseExecutor>();
            services.AddTransient<JwtManager>();

            services.AddTransient<CreateProductValidator>();
            services.AddTransient<UpdateProductValidator>();
            services.AddTransient<UpdateProductColorValidator>();
            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<AddToCartValidator>();
            services.AddTransient<RequestUpdateCartDtoValidator>();
            services.AddTransient<AddOrderValidator>();
            services.AddTransient<RequestCreateSizeDtoValidator>();
            services.AddTransient<RequestCreateColorDtoValidator>();
            services.AddTransient<RequestCreateCategoryDtoValidator>();
            services.AddTransient<UpdateColorValidator>();
            services.AddTransient<UpdateSizeValidator>();
            services.AddTransient<UpdateCategoryValidator>();

            services.AddTransient<RequestCreateProductDtoMap>();
            services.AddTransient<RequestUpdateProductDtoMap>();

            services.AddTransient<ICreateProductCommand, CreateProductCommand>();
            services.AddTransient<IDeleteProductCommand, DeleteProductCommand>();
            services.AddTransient<IUpdateProductCommand, UpdateProductCommand>();
            services.AddTransient<IUpdateProductColorCommand, UpdateProductColorCommand>();
            services.AddTransient<IRegisterUserCommand, RegisterUserCommand>();
            services.AddTransient<IAddToCartCommand, AddToCartCommand>();
            services.AddTransient<IUpdateCartCommand, UpdateCartCommand>();
            services.AddTransient<IDeleteCartCommand, DeleteCartCommand>();
            services.AddTransient<IAddOrderCommand, AddOrderCommand>();
            services.AddTransient<IDeleteUserCommand, DeleteUserCommand>();
            services.AddTransient<IUpdateUserCommand, UpdateUserCommand>();


            services.AddTransient<ICreateCategoryCommand, CreateCategoryCommand>();
            services.AddTransient<IUpdateCategoryCommand, UpdateCategoryCommand>();
            services.AddTransient<IDeleteCategoryCommand, DeleteCategoryCommand>();
            services.AddTransient<ICreateColorCommand, CreateColorCommand>();
            services.AddTransient<IUpdateColorCommand, UpdateColorCommand>();
            services.AddTransient<IDeleteColorCommand, DeleteColorCommand>();
            services.AddTransient<ICreateSizeCommand, CreateSizeCommand>();
            services.AddTransient<IUpdateSizeCommand, UpdateSizeCommand>();
            services.AddTransient<IDeleteSizeCommand, DeleteSizeCommand>();


            services.AddTransient<IGetProductsQuery, GetProductsQuery>();
            services.AddTransient<IGetProductQuery, GetProductQuery>();
            services.AddTransient<IGetCartQuery, GetCartQuery>();
            services.AddTransient<IGetOrdersQuery, GetOrdersQuery>();
            services.AddTransient<IGetOrderLinesQuery, GetOrderLinesQuery>();
            services.AddTransient<IGetLogsQuery, GetLogsQuery>();
            services.AddTransient<IGetUsersQuery, GetUsersQuery>();

            services.AddTransient<IGetCategoriesQuery, GetCategoriesQuery>();
            services.AddTransient<IGetCategoryQuery, GetCategoryQuery>();
            services.AddTransient<IGetColorsQuery, GetColorsQuery>();
            services.AddTransient<IGetColorQuery, GetColorQuery>();
            services.AddTransient<IGetSizesQuery, GetSizesQuery>();
            services.AddTransient<IGetSizeQuery, GetSizeQuery>();


            services.AddTransient<IEmailSender, SmtpEmailSender>();

            services.AddTransient<IUseCaseLogger, DatabaseUseCaseLogger>();
            services.AddTransient<IApplicationActor, FakeApiActor>();


            services.AddHttpContextAccessor();
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new AnonymousActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;

            });

            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });




            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Shop", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference
                              {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                              },
                              Scheme = "oauth2",
                              Name = "Bearer",
                              In = ParameterLocation.Header,

                        },
                        new List<string>()
                    }
                });
            });




        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseSwagger();

            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Swagger");
            });

            app.UseCors(x =>
            {
                x.AllowAnyOrigin();
                x.AllowAnyMethod();
                x.AllowAnyHeader();
            });

            app.UseRouting();
            app.UseStaticFiles();
            app.UseMiddleware<GlobalExceptionHandler>();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
