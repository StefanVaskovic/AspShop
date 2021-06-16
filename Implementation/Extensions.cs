using Application.DataTransfer.Product;
using AutoMapper;
using Domain;
using EfDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation
{
    public static class Extensions
    {
        public static T GetDto<T>(this Product product, ShopContext context, IMapper mapper)
            where T : BaseGetProductDto, new()
        {

            if (typeof(T) == typeof(GetProductsDto))
            {
                return product.Get<GetProductsDto>(context, mapper) as T;
            }

            var dto = product.Get<GetProductDto>(context, mapper);
            dto.Description = product.Description;

            return dto as T;

        }

        private static T Get<T>(this Product product, ShopContext context, IMapper mapper)
            where T : BaseGetProductDto, new()
        {
            var productColorsSizes =  context.ProductColorSizes.Include(pcs=>pcs.ProductColor).ThenInclude(pc => pc.Product).ToList();

            T t = mapper.Map<T>(product);

            t.SizeColorsQuantities = productColorsSizes.GroupBy(pcs => new { pcs.SizeId }).Select(grp => new SizeColorsQuantitiesDto
            {
                SizeId = grp.Key.SizeId,
                ColorsQuantities = grp.AsEnumerable().Where(x => x.ProductColor.Product.Id == product.Id).Select(pcs => new ColorsQuantitiesDto
                {
                    ColorId = pcs.ProductColor.ColorId,
                    Quantity = pcs.Quantity
                }).ToList()
            }).ToList();

            return t;
        }
    }
}
