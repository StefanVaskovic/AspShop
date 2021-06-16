using Domain;
using EfDataAccess.Configurations;
using EfDataAccess.Extensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess
{
    public class ShopContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=.\SQLEXPRESS;Initial Catalog=shop;Integrated Security=True;"+ "MultipleActiveResultSets=True");

            base.OnConfiguring(optionsBuilder);
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Configure();

            modelBuilder.Entity<Product>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Color>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Size>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Category>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Order>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<OrderLine>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<User>().HasQueryFilter(x => !x.IsDeleted);

            base.OnModelCreating(modelBuilder);
        }

        public override int SaveChanges()
        {
            foreach(var entry in ChangeTracker.Entries())
            {
                if(entry.Entity is Entity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.CreatedAt = DateTime.UtcNow;
                            e.DeletedAt = null;
                            e.IsActive = true;
                            e.IsDeleted = false;
                            e.UpdatedAt = null;
                            break;
                        case EntityState.Modified:
                            e.UpdatedAt = DateTime.UtcNow;
                            break;
                    }
                }
            }

            return base.SaveChanges();
        }
        public DbSet<User> Users { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderLine> OrderLines { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Color> Colors { get; set; }
        public DbSet<ProductColor> ProductColors { get; set; }
        public DbSet<Size> Sizes { get; set; }
        public DbSet<ProductColorSize> ProductColorSizes { get; set; }
        //public DbSet<Comment> Comments { get; set; }
        public DbSet<AuditLog> AuditLogs { get; set; }
        public DbSet<Cart> Carts { get; set; }
    }
}
