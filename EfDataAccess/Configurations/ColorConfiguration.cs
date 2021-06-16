using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    class ColorConfiguration : IEntityTypeConfiguration<Color>
    {
        public void Configure(EntityTypeBuilder<Color> builder)
        {
            builder.HasIndex(x => x.Name).IsUnique();
            builder.Property(x => x.Name).IsRequired();

            builder.HasMany(x => x.ProductColors)
                   .WithOne(pc => pc.Color)
                   .HasForeignKey(pc => pc.ColorId)
                   .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
