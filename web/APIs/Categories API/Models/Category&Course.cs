using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IBSRA.Models
{
    public class Category
    {
        public int ID { get; set; }

        [Required, MaxLength(100)]
        public string Name { get; set; }

        [MaxLength(500)]
        public string Description { get; set; }

        [MaxLength(300)]
        public string IconUrl { get; set; }

        [MaxLength(20)]
        public string Color { get; set; } = "#007bff";

        public bool IsActive { get; set; } = true;

        public int DisplayOrder { get; set; } = 0;

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        public DateTime UpdatedAt { get; set; } = DateTime.Now;

        // Navigation property - EF will handle the relationship
        public virtual ICollection<Course> Courses { get; set; } = new List<Course>();

        // Computed property
        [NotMapped]
        public int CourseCount => Courses?.Count ?? 0;
    }

    public class Course
    {
        public int ID { get; set; }

        [Required, MaxLength(200)]
        public string CourseName { get; set; }

        [Required]
        public int CategoryID { get; set; }

        [MaxLength(500)]
        public string Description { get; set; }

        [MaxLength(300)]
        public string ImageUrl { get; set; }

        [MaxLength(100)]
        public string Instructor { get; set; }

        [MaxLength(50)]
        public string Duration { get; set; }

        [Range(0, 5)]
        public decimal? Rating { get; set; }

        [Range(0, double.MaxValue)]
        public decimal? Price { get; set; }

        // Navigation property
        public virtual Category Category { get; set; }
    }
}
