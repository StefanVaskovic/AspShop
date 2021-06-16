using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    public class ProductConfiguration : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            builder.HasIndex(x => x.Name).IsUnique();

            builder.Property(x => x.Name).IsRequired();
            builder.Property(x => x.CurrentPrice).IsRequired();
            builder.Property(x => x.Description).IsRequired();
            builder.Property(x => x.Cover).IsRequired();

            builder.HasMany(x => x.OrderLines)
                   .WithOne(ol => ol.Product)
                   .HasForeignKey(ol => ol.ProductId)
                   .OnDelete(DeleteBehavior.SetNull);

            //builder.HasMany(x => x.Comments)
            //       .WithOne(c => c.Product)
            //       .HasForeignKey(c => c.ProductId)
            //       .OnDelete(DeleteBehavior.Cascade);

            builder.HasMany(x => x.ProductColors)
                   .WithOne(pc => pc.Product)
                   .HasForeignKey(pc => pc.ProductId)
                   .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
