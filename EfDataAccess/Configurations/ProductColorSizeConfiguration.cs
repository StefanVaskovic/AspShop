using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    public class ProductColorSizeConfiguration : IEntityTypeConfiguration<ProductColorSize>
    {
        public void Configure(EntityTypeBuilder<ProductColorSize> builder)
        {
            builder.HasMany(x => x.Carts)
                   .WithOne(c => c.ProductColorSize)
                   .HasForeignKey(c => c.ProductColorSizeId)
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
