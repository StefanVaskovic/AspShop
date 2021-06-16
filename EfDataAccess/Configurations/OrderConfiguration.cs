using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    public class OrderConfiguration : IEntityTypeConfiguration<Order>
    {
        public void Configure(EntityTypeBuilder<Order> builder)
        {
            builder.HasMany(x => x.OrderLines)
                   .WithOne(ol => ol.Order)
                   .HasForeignKey(ol => ol.OrderId)
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
