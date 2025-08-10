using YourApp.Models.DTOs;

namespace YourApp.Services
{
    public interface ICourseService
    {
        Task<CourseRecommendationsResponse> GetCourseRecommendationsAsync(CourseSearchRequest request);
        Task<CourseRecommendationsResponse> GetPersonalizedRecommendationsAsync(int userId, int count = 5);
        Task<CourseRecommendationsResponse> GetTrendingCoursesAsync(int count = 10);
        Task<ApiResponse<CourseDto>> GetCourseByIdAsync(int courseId);
        Task<CourseRecommendationsResponse> SearchCoursesAsync(CourseSearchRequest request);
    }
}
