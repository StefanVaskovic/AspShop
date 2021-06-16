using Application.Commands;
using Application.DataTransfer.Product;
using AutoMapper;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class UpdateProductCommand : UseCaseBase, IUpdateProductCommand
    {
        private readonly UpdateProductValidator _validator;
        private readonly IMapper _mapper;

        public UpdateProductCommand(ShopContext context, UpdateProductValidator validator, IMapper mapper)
            : base(context)
        {
            _validator = validator;
            _mapper = mapper;
        }
        public int Id => 9;

        public string Name => "Update Product using EF";

        public void Execute(UpdateProductDto request)
        {
            _validator.ValidateAndThrow(request);

            var product = _context.Products
                .Include(p=>p.ProductColors)
                .ThenInclude(pc=>pc.ProductColorSizes)
                .FirstOrDefault(p=>p.Id == request.Id);

            var newFileName = Image.ReUpload(request.CoverImage, product.Cover);

            _mapper.Map(request, product);

            product.Cover = newFileName;


            var productColorSizes = product.ProductColors.SelectMany(pc => pc.ProductColorSizes);

            foreach (var item in productColorSizes)
            {
                foreach (var reqItem in request.ProductColorSizes)
                {
                    if(item.Id == reqItem.Id)
                    {
                        _mapper.Map(reqItem, item);
                        request.ProductColorSizes.Remove(reqItem);
                        break;
                    }
                }
            }

            _context.SaveChanges();

        }
    }
}
