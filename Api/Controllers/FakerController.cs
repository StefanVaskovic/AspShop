using Bogus;
using Domain;
using Domain.Enums;
using EfDataAccess;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FakerController : ControllerBase
    {
        // GET: api/<FakerController>
        [HttpGet]
        public IActionResult Get()
        {
            var context = new ShopContext();

            //List<Category> categories = GetFakeCategories();
            //context.Categories.AddRange(categories);

            //GenereateSizes(context);

            //GenereateColors(context);

            //Faker<User> users = GenerateFakeUsers();
            //context.Users.AddRange(users.Generate(2));

            //var ordersFaker = new Faker<Order>();
            //var userIds = context.Users.Select(x => x.Id).ToList();
            //var categoryIds = context.Categories.Select(x => x.Id).ToList();

            //ordersFaker.RuleFor(x => x.Address, f => f.Address.FullAddress());
            //ordersFaker.RuleFor(x => x.TotalPrice, f => f.Random.Decimal(40.00m, 100.00m));
            //ordersFaker.RuleFor(x => x.UserId, f => f.PickRandom(userIds));

            //var orders = ordersFaker.Generate(2);



            //var productsFaker = new Faker<Product>();
            //Gender[] genders = (Enum.GetValues(typeof(Gender))).Cast<Gender>().ToArray();
            //productsFaker.RuleFor(x => x.CategoryId, f => f.PickRandom(categoryIds));
            //productsFaker.RuleFor(x => x.Description, f => f.Lorem.Text());
            //productsFaker.RuleFor(x => x.DiscountRate, f => f.Random.Int(10, 90));
            //productsFaker.RuleFor(x => x.CurrentPrice, 9999.99m);
            //productsFaker.RuleFor(x => x.OldPrice, 8499.99m);
            //productsFaker.RuleFor(x => x.Rate, 5);
            //productsFaker.RuleFor(x => x.Name, f => f.Commerce.ProductName());
            //productsFaker.RuleFor(x => x.Gender, f => f.PickRandom(genders));
            //productsFaker.RuleFor(x => x.Cover, "cover.jpg");
            //var products = productsFaker.Generate(25);

            //var orderLinesFaker = new Faker<OrderLine>();


            
            //orderLinesFaker.RuleFor(x => x.Price, 1000);
            //orderLinesFaker.RuleFor(x => x.Quantity, 3);
            //orderLinesFaker.RuleFor(x => x.Product, f => f.PickRandom(products));

            context.SaveChanges();

            return Ok();
        }

        private static Faker<User> GenerateFakeUsers()
        {
            var users = new Faker<User>();
            users.RuleFor(x => x.FirstName, f => f.Name.FirstName());
            users.RuleFor(x => x.LastName, f => f.Name.LastName());
            users.RuleFor(x => x.Email, f => f.Person.Email);

            var sha1 = new SHA1CryptoServiceProvider();
            var data = Encoding.ASCII.GetBytes("sifra1");
            var sha1data = sha1.ComputeHash(data);
            //var aSCIIEncoding = new ASCIIEncoding();
            var hashedPassword = Convert.ToBase64String(sha1data);
            users.RuleFor(x => x.Password, hashedPassword);
            return users;
        }

        private static void GenereateColors(ShopContext context)
        {
            string[] colors = { "Red", "Blue", "Green", "Dark", "Yellow" };

            for (int i = 0; i < colors.Length; i++)
            {
                context.Colors.Add(new Color { Name = colors[i] });
            }
        }
        private static void GenereateSizes(ShopContext context)
        {
            string[] sizes = { "S", "M", "L", "XL", "XXL" };

            for (int i = 0; i < sizes.Length; i++)
            {
                context.Sizes.Add(new Size { Name = sizes[i] });
            }
        }

        private static List<Category> GetFakeCategories()
        {
            var categoriesFaker = new Faker<Category>();
            categoriesFaker.RuleFor(x => x.Name, f => f.Lorem.Word());
            var categories = categoriesFaker.Generate(5);
            return categories;
        }
    }
}
