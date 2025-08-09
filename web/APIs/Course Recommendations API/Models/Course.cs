using System.ComponentModel.DataAnnotations;

namespace YourApp.Models
{
    public class Course
    {
        public int Id { get; set; }
        
        [Required, MaxLength(200)]
        public string CourseName { get; set; }
        
        [Required, MaxLength(100)]
        public string Category { get; set; }
        
        [MaxLength(500)]
        public string? ImageUrl { get; set; }
        
        [MaxLength(1000)]
        public string? Description { get; set; }
        
        [MaxLength(100)]
        public string? Instructor { get; set; }
        
        [MaxLength(50)]
        public string? Duration { get; set; }
        
        [Range(0, 5)]
        public decimal? Rating { get; set; }
        
        [Range(0, double.MaxValue)]
        public decimal? Price { get; set; }
        
        public bool IsRecommended { get; set; } = false;
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        // Navigation properties
        public virtual ICollection<UserCourseRecommendation> UserRecommendations { get; set; } = new List<UserCourseRecommendation>();
    }

    public class UserCourseRecommendation
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int CourseId { get; set; }
        public decimal RecommendationScore { get; set; } = 0;
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        // Navigation properties
        public virtual User User { get; set; }
        public virtual Course Course { get; set; }
    }
}
