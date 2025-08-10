using Microsoft.EntityFrameworkCore;
using YourApp.Data;
using YourApp.Models;

namespace YourApp.Repositories
{
    public class CourseRepository : ICourseRepository
    {
        private readonly AppDbContext _context;

        public CourseRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<Course?> GetByIdAsync(int courseId)
        {
            return await _context.Courses
                .FirstOrDefaultAsync(c => c.Id == courseId);
        }

        public async Task<List<Course>> GetByCategoryAsync(string category, int page, int pageSize)
        {
            return await _context.Courses
                .Where(c => c.Category == category)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();
        }

        public async Task<List<Course>> GetExcludingCourseIdsAsync(List<int> excludedCourseIds, int count)
        {
            return await _context.Courses
                .Where(c => !excludedCourseIds.Contains(c.Id))
                .OrderByDescending(c => c.Rating)
                .ThenByDescending(c => c.IsRecommended)
                .Take(count)
                .ToListAsync();
        }

        public async Task<List<Course>> GetTopRatedAsync(int count)
        {
            return await _context.Courses
                .OrderByDescending(c => c.Rating)
                .Take(count)
                .ToListAsync();
        }

        public async Task<List<Course>> SearchCoursesAsync(
            string? searchTerm,
            string? category,
            decimal? minPrice,
            decimal? maxPrice,
            decimal? minRating,
            string? instructor,
            int page,
            int pageSize)
        {
            var query = _context.Courses.AsQueryable();

            if (!string.IsNullOrEmpty(searchTerm))
            {
                var searchTermLower = searchTerm.ToLower();
                query = query.Where(c => 
                    c.CourseName.ToLower().Contains(searchTermLower) ||
                    c.Description!.ToLower().Contains(searchTermLower) ||
                    c.Instructor!.ToLower().Contains(searchTermLower)
                );
            }

            if (!string.IsNullOrEmpty(category))
                query = query.Where(c => c.Category == category);

            if (minPrice.HasValue)
                query = query.Where(c => c.Price >= minPrice);

            if (maxPrice.HasValue)
                query = query.Where(c => c.Price <= maxPrice);

            if (minRating.HasValue)
                query = query.Where(c => c.Rating >= minRating);

            if (!string.IsNullOrEmpty(instructor))
                query = query.Where(c => c.Instructor == instructor);

            return await query
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();
        }

        public async Task<int> GetTotalCountAsync()
        {
            return await _context.Courses.CountAsync();
        }

        public async Task<int> GetCategoryCountAsync(string category)
        {
            return await _context.Courses
                .Where(c => c.Category == category)
                .CountAsync();
        }

        public async Task<int> GetSearchCountAsync(
            string? searchTerm,
            string? category,
            decimal? minPrice,
            decimal? maxPrice,
            decimal? minRating,
            string? instructor)
        {
            var query = _context.Courses.AsQueryable();

            if (!string.IsNullOrEmpty(searchTerm))
            {
                var searchTermLower = searchTerm.ToLower();
                query = query.Where(c => 
                    c.CourseName.ToLower().Contains(searchTermLower) ||
                    c.Description!.ToLower().Contains(searchTermLower) ||
                    c.Instructor!.ToLower().Contains(searchTermLower)
                );
            }

            if (!string.IsNullOrEmpty(category))
                query = query.Where(c => c.Category == category);

            if (minPrice.HasValue)
                query = query.Where(c => c.Price >= minPrice);

            if (maxPrice.HasValue)
                query = query.Where(c => c.Price <= maxPrice);

            if (minRating.HasValue)
                query = query.Where(c => c.Rating >= minRating);

            if (!string.IsNullOrEmpty(instructor))
                query = query.Where(c => c.Instructor == instructor);

            return await query.CountAsync();
        }

        public async Task<List<int>> GetUserRecommendedCourseIdsAsync(int userId)
        {
            return await _context.UserCourseRecommendations
                .Where(ucr => ucr.UserId == userId)
                .Select(ucr => ucr.CourseId)
                .ToListAsync();
        }
    }
}
