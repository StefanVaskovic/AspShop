using Application.DataTransfer.Color;
using Application.DataTransfer.Product;
using Application.DataTransfer.Size;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Application
{
    public static class Extensions
    {
        //public static CreateProductDto AsCreateProductDto(this Product product)
        //{

        //}

        //public static T GetDto<T>(this Product product)
        //    where T : BaseGetProductDto, new()
        //{

        //    if (typeof(T) == typeof(GetProductsDto))
        //    {
        //         return product.Get<GetProductsDto>() as T;
        //    }

        //    var dto = product.Get<GetProductDto>();
        //    dto.Description = product.Description;

        //    return dto as T;

        //}

        //private static T Get<T>(this Product product)
        //    where T : BaseGetProductDto, new()
        //{
            

        //    return new T
        //    {
        //        Id = product.Id,
        //        Name = product.Name,
        //        CategoryId = product.CategoryId,
        //        Cover = product.Cover,
        //        CurrentPrice = product.CurrentPrice,
        //        DiscountRate = product.DiscountRate,
        //        Gender = product.Gender.ToString(),
        //        OldPrice = product.OldPrice,
        //        SizeColorsQuantities = product.ProductColors.Select(pc => new SizeColorsQuantitiesDto
        //        {
        //            SizeId = pc.ProductColorSizes.FirstOrDefault(pcs => pcs.ProductColorId == pc.Id).SizeId
        //        }).ToList()
        //    };
        //    //return new T
        //    //{
        //    //    Id = product.Id,
        //    //    Name = product.Name,
        //    //    CategoryId = product.CategoryId,
        //    //    Cover = product.Cover,
        //    //    CurrentPrice = product.CurrentPrice,
        //    //    DiscountRate = product.DiscountRate,
        //    //    Gender = product.Gender.ToString(),
        //    //    OldPrice = product.OldPrice,
        //    //    ColorSizesQuantities = product.ProductColors.Select(pc => new ColorSizesQuantitiesDto
        //    //    {
        //    //        Color = new ColorDto
        //    //        {
        //    //            Id = pc.ColorId,
        //    //            Name = pc.Color.Name
        //    //        },
        //    //        SizesQuantities = pc.ProductColorSizes.Select(pcs => new SizesQuantitiesDto
        //    //        {
        //    //            Size = new SizeDto
        //    //            {
        //    //                Id = pcs.SizeId,
        //    //                Name = pcs.Size.Name
        //    //            },
        //    //            Quantity = pcs.Quantity
        //    //        }).ToList()
        //    //    }).ToList()
        //    //};
        //}
    }
}
