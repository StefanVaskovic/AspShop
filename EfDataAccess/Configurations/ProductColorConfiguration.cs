using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    public class ProductColorConfiguration : IEntityTypeConfiguration<ProductColor>
    {
        public void Configure(EntityTypeBuilder<ProductColor> builder)
        {
            builder.HasMany(x => x.ProductColorSizes)
                   .WithOne(pcs => pcs.ProductColor)
                   .HasForeignKey(pcs => pcs.ProductColorId)
                   .OnDelete(DeleteBehavior.Cascade);


        }
    }
}
