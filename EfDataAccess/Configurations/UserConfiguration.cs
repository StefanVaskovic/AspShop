using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.Property(x => x.FirstName).IsRequired().HasMaxLength(30);

            builder.Property(x => x.LastName).IsRequired().HasMaxLength(30);

            builder.Property(x => x.Email).IsRequired().HasMaxLength(50);

            builder.Property(x => x.Password).IsRequired();

            builder.HasIndex(x => x.Email).IsUnique();

            builder.HasMany(x => x.Orders)
                   .WithOne(o => o.User)
                   .HasForeignKey(o => o.UserId)
                   .OnDelete(DeleteBehavior.Restrict);

            //builder.HasMany(x => x.Comments)
            //       .WithOne(c => c.User)
            //       .HasForeignKey(c => c.UserId)
            //       .OnDelete(DeleteBehavior.SetNull);

            builder.HasMany(x => x.Carts)
                   .WithOne(c => c.User)
                   .HasForeignKey(c => c.UserId)
                   .OnDelete(DeleteBehavior.Cascade);

            //builder.HasMany(x => x.LikedComments)
            //       .WithOne(c => c.User)
            //       .HasForeignKey(c => c.UserId)
            //       .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
