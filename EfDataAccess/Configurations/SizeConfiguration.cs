using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    class SizeConfiguration : IEntityTypeConfiguration<Size>
    {
        public void Configure(EntityTypeBuilder<Size> builder)
        {
            builder.Property(x => x.Name).IsRequired();
            builder.HasIndex(x => x.Name).IsUnique();

            builder.HasMany(x => x.ProductColorSizes)
                   .WithOne(pcs => pcs.Size)
                   .HasForeignKey(pcs => pcs.SizeId)
                   .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
