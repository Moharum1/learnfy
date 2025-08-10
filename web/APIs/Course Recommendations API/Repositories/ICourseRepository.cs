using YourApp.Models;

namespace YourApp.Repositories
{
    public interface ICourseRepository
    {
        Task<Course?> GetByIdAsync(int courseId);
        Task<List<Course>> GetByCategoryAsync(string category, int page, int pageSize);
        Task<List<Course>> GetExcludingCourseIdsAsync(List<int> excludedCourseIds, int count);
        Task<List<Course>> GetTopRatedAsync(int count);
        Task<List<Course>> SearchCoursesAsync(
            string? searchTerm,
            string? category,
            decimal? minPrice,
            decimal? maxPrice,
            decimal? minRating,
            string? instructor,
            int page,
            int pageSize);
        Task<int> GetTotalCountAsync();
        Task<int> GetCategoryCountAsync(string category);
        Task<int> GetSearchCountAsync(
            string? searchTerm,
            string? category,
            decimal? minPrice,
            decimal? maxPrice,
            decimal? minRating,
            string? instructor);
        Task<List<int>> GetUserRecommendedCourseIdsAsync(int userId);
    }
}
