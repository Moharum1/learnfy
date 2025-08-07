using AutoMapper;
using Microsoft.EntityFrameworkCore;
using YourApp.Data;
using YourApp.Models;
using YourApp.Models.DTOs;

namespace YourApp.Services
{
    public class CourseService : ICourseService
    {
        private readonly AppDbContext _context;
        private readonly IMapper _mapper;

        public CourseService(AppDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<CourseRecommendationsResponse> GetCourseRecommendationsAsync(CourseSearchRequest request)
        {
            var query = _context.Courses.AsQueryable();

            // Apply filters
            if (!string.IsNullOrEmpty(request.Category))
                query = query.Where(c => c.Category == request.Category);

            var totalCount = await query.CountAsync();
            var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

            // Get courses from database
            var courses = await query
                .Skip((request.Page - 1) * request.PageSize)
                .Take(request.PageSize)
                .ToListAsync();

            // Use mapper to convert to DTOs
            var recommendations = _mapper.Map<List<CourseRecommendationDto>>(courses);

            // Apply sorting to DTOs
            recommendations = request.SortBy?.ToLower() switch
            {
                "price" => request.SortOrder == "desc" 
                    ? recommendations.OrderByDescending(c => c.Price).ToList()
                    : recommendations.OrderBy(c => c.Price).ToList(),
                "name" => request.SortOrder == "desc"
                    ? recommendations.OrderByDescending(c => c.CourseName).ToList()
                    : recommendations.OrderBy(c => c.CourseName).ToList(),
                _ => request.SortOrder == "desc"
                    ? recommendations.OrderByDescending(c => c.RecommendationScore).ToList()
                    : recommendations.OrderBy(c => c.RecommendationScore).ToList()
            };

            return new CourseRecommendationsResponse(
                true,
                "Course recommendations retrieved successfully",
                recommendations,
                totalCount,
                request.Page,
                totalPages
            );
        }

        public async Task<CourseRecommendationsResponse> GetPersonalizedRecommendationsAsync(int userId, int count = 5)
        {
            // Get courses not already recommended to the user
            var excludedCourseIds = await _context.UserCourseRecommendations
                .Where(ucr => ucr.UserId == userId)
                .Select(ucr => ucr.CourseId)
                .ToListAsync();

            var courses = await _context.Courses
                .Where(c => !excludedCourseIds.Contains(c.Id))
                .OrderByDescending(c => c.Rating)
                .ThenByDescending(c => c.IsRecommended)
                .Take(count)
                .ToListAsync();

            // Use mapper to convert to DTOs
            var recommendations = _mapper.Map<List<CourseRecommendationDto>>(courses);

            // Apply personalized scoring after mapping
            foreach (var recommendation in recommendations)
            {
                var originalCourse = courses.First(c => c.Id == recommendation.Id);
                recommendation = recommendation with 
                { 
                    RecommendationScore = (originalCourse.Rating ?? 0) * 1.5m + (originalCourse.IsRecommended ? 2.0m : 0) 
                };
            }

            // Sort by recommendation score
            recommendations = recommendations.OrderByDescending(c => c.RecommendationScore).ToList();

            return new CourseRecommendationsResponse(
                true,
                "Personalized recommendations retrieved successfully",
                recommendations,
                recommendations.Count,
                1,
                1
            );
        }

        public async Task<CourseRecommendationsResponse> GetTrendingCoursesAsync(int count = 10)
        {
            var courses = await _context.Courses
                .OrderByDescending(c => c.Rating)
                .Take(count)
                .ToListAsync();

            // Use mapper to convert to DTOs
            var trendingCourses = _mapper.Map<List<CourseRecommendationDto>>(courses);

            return new CourseRecommendationsResponse(
                true,
                "Trending courses retrieved successfully",
                trendingCourses,
                trendingCourses.Count,
                1,
                1
            );
        }

        public async Task<ApiResponse<CourseDto>> GetCourseByIdAsync(int courseId)
        {
            var course = await _context.Courses
                .FirstOrDefaultAsync(c => c.Id == courseId);

            if (course == null)
                return new ApiResponse<CourseDto>(false, "Course not found");

            // Use mapper to convert to DTO
            var courseDto = _mapper.Map<CourseDto>(course);

            return new ApiResponse<CourseDto>(true, "Course details retrieved successfully", courseDto);
        }

        public async Task<CourseRecommendationsResponse> SearchCoursesAsync(CourseSearchRequest request)
        {
            var query = _context.Courses.AsQueryable();

            // Apply search filters
            if (!string.IsNullOrEmpty(request.SearchTerm))
            {
                var searchTerm = request.SearchTerm.ToLower();
                query = query.Where(c => 
                    c.CourseName.ToLower().Contains(searchTerm) ||
                    c.Description!.ToLower().Contains(searchTerm) ||
                    c.Instructor!.ToLower().Contains(searchTerm)
                );
            }

            if (!string.IsNullOrEmpty(request.Category))
                query = query.Where(c => c.Category == request.Category);

            if (request.MinPrice.HasValue)
                query = query.Where(c => c.Price >= request.MinPrice);

            if (request.MaxPrice.HasValue)
                query = query.Where(c => c.Price <= request.MaxPrice);

            if (request.MinRating.HasValue)
                query = query.Where(c => c.Rating >= request.MinRating);

            if (!string.IsNullOrEmpty(request.Instructor))
                query = query.Where(c => c.Instructor == request.Instructor);

            var totalCount = await query.CountAsync();
            var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

            // Get courses from database
            var courses = await query
                .Skip((request.Page - 1) * request.PageSize)
                .Take(request.PageSize)
                .ToListAsync();

            // Use mapper to convert to DTOs
            var results = _mapper.Map<List<CourseRecommendationDto>>(courses);

            // Apply sorting to DTOs
            results = request.SortBy?.ToLower() switch
            {
                "price" => request.SortOrder == "desc"
                    ? results.OrderByDescending(c => c.Price).ToList()
                    : results.OrderBy(c => c.Price).ToList(),
                "name" => request.SortOrder == "desc"
                    ? results.OrderByDescending(c => c.CourseName).ToList()
                    : results.OrderBy(c => c.CourseName).ToList(),
                _ => request.SortOrder == "desc"
                    ? results.OrderByDescending(c => c.RecommendationScore).ToList()
                    : results.OrderBy(c => c.RecommendationScore).ToList()
            };

            return new CourseRecommendationsResponse(
                true,
                "Search completed successfully",
                results,
                totalCount,
                request.Page,
                totalPages
            );
        }
    }
}
