using Application.Commands;
using Application.DataTransfer.Product;
using Domain;
using Domain.Enums;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class CreateProductCommand : UseCaseBase, ICreateProductCommand
    {
        private readonly CreateProductValidator _validator;

        public CreateProductCommand(ShopContext context, CreateProductValidator validator)
            :base(context)
        {
            _validator = validator;
        }

        public int Id => 1;

        public string Name => "Create product using EF";

        public void Execute(CreateProductDto request)
        {
            _validator.ValidateAndThrow(request);

            var newFileName = Image.Upload(request.CoverImage);
            decimal currentPrice = request.CurrentPrice.Value;
            decimal? oldPrice = null;

            if(request.DiscountRate != null)
            {
                currentPrice = currentPrice - (currentPrice * request.DiscountRate.Value / 100);
                oldPrice = request.CurrentPrice;
            }

            
            var product = new Product
            {
                CategoryId = request.CategoryId.Value,
                Name = request.Name,
                Cover = newFileName,
                Gender = request.Gender.Value,
                DiscountRate = request.DiscountRate,
                CurrentPrice = currentPrice,
                OldPrice = oldPrice,
                Description = request.Description
            };

            _context.Products.Add(product);

            var productColors = new List<ProductColor>();

            foreach (var sizeColorsQuantities in request.SizesColorsQuantities)
            {
                foreach (var colorQuantity in sizeColorsQuantities.ColorsQuantities)
                {
                    var productColor = new ProductColor
                    {
                        ColorId = colorQuantity.ColorId,
                        Product = product
                    };

                    var obj = productColors.Where(x => x.ColorId == colorQuantity.ColorId).FirstOrDefault();

                    if (obj == null)
                    {
                        _context.ProductColors.Add(productColor);
                        productColors.Add(productColor);
                    }
                    else
                    {
                        productColor = obj;
                    }

                    var productColorSize = new ProductColorSize
                    {
                        ProductColor = productColor,
                        Quantity = colorQuantity.Quantity,
                        SizeId = sizeColorsQuantities.SizeId.Value
                    };

                    _context.ProductColorSizes.Add(productColorSize);
                    
                }
            }
            _context.SaveChanges();

        }
    }
}
