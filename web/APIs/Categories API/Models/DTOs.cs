using System.Collections.Generic;

namespace IBSRA.DTOs
{
    public class CategorySummaryDto
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string IconUrl { get; set; }
        public string Color { get; set; }
        public int CourseCount { get; set; }
    }

    public class CategoryDetailsDto : CategorySummaryDto
    {
        public bool IsActive { get; set; }
        public int DisplayOrder { get; set; }
        public List<CourseDto> PopularCourses { get; set; }
    }

    public class CourseDto
    {
        public int ID { get; set; }
        public string CourseName { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public string Instructor { get; set; }
        public string Duration { get; set; }
        public decimal? Rating { get; set; }
        public decimal? Price { get; set; }
    }

    public class ApiResponse<T>
    {
        public bool Success { get; set; }
        public string Message { get; set; }
        public T Data { get; set; }
        public int? TotalCount { get; set; }
    }
}