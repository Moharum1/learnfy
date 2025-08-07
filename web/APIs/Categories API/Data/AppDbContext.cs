using System.Collections.Generic;
using System.Data.Entity;
using IBSRA.Models;

namespace IBSRA.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext() : base("DefaultConnection") { }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Course> Courses { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            // Configure relationships
            modelBuilder.Entity<Course>()
                .HasRequired(c => c.Category)
                .WithMany(cat => cat.Courses)
                .HasForeignKey(c => c.CategoryID);

            // Seed data
            modelBuilder.Entity<Category>().HasData(
                new Category { ID = 1, Name = "Software Development", Description = "Learn programming languages, frameworks, and development tools", IconUrl = "https://cdn-icons-png.flaticon.com/512/1005/1005141.png", Color = "#007bff", DisplayOrder = 1 },
                new Category { ID = 2, Name = "Data Science", Description = "Master data analysis, machine learning, and statistics", IconUrl = "https://cdn-icons-png.flaticon.com/512/2103/2103665.png", Color = "#28a745", DisplayOrder = 2 },
                new Category { ID = 3, Name = "Mathematics", Description = "Explore mathematical concepts from basics to advanced topics", IconUrl = "https://cdn-icons-png.flaticon.com/512/3771/3771275.png", Color = "#dc3545", DisplayOrder = 3 }
            );

            base.OnModelCreating(modelBuilder);
        }
    }
}
