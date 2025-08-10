using AutoMapper;
using YourApp.Models;
using YourApp.Models.DTOs;
using YourApp.Repositories;

namespace YourApp.Services
{
    public class CourseService : ICourseService
    {
        private readonly ICourseRepository _courseRepository;
        private readonly IMapper _mapper;

        public CourseService(ICourseRepository courseRepository, IMapper mapper)
        {
            _courseRepository = courseRepository;
            _mapper = mapper;
        }

        public async Task<CourseRecommendationsResponse> GetCourseRecommendationsAsync(CourseSearchRequest request)
        {
            // Business logic: Get count for pagination
            var totalCount = await _courseRepository.GetCategoryCountAsync(request.Category ?? "");
            var totalPages = CalculateTotalPages(totalCount, request.PageSize);

            // Repository handles data retrieval
            var courses = await _courseRepository.GetByCategoryAsync(
                request.Category ?? "", 
                request.Page, 
                request.PageSize);

            // Business logic: Convert to DTOs using mapper
            var recommendations = _mapper.Map<List<CourseRecommendationDto>>(courses);

            // Business logic: Apply sorting
            recommendations = ApplySorting(recommendations, request.SortBy, request.SortOrder);

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
            // Business logic: Get excluded courses for this user
            var excludedCourseIds = await _courseRepository.GetUserRecommendedCourseIdsAsync(userId);

            // Repository handles data retrieval with exclusions
            var courses = await _courseRepository.GetExcludingCourseIdsAsync(excludedCourseIds, count);

            // Business logic: Convert to DTOs using mapper
            var recommendations = _mapper.Map<List<CourseRecommendationDto>>(courses);

            // Business logic: Apply personalized scoring algorithm
            recommendations = ApplyPersonalizedScoring(recommendations, courses);

            // Business logic: Sort by recommendation score
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
            // Repository handles data retrieval
            var courses = await _courseRepository.GetTopRatedAsync(count);

            // Business logic: Convert to DTOs using mapper
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
            // Repository handles data retrieval
            var course = await _courseRepository.GetByIdAsync(courseId);

            // Business logic: Validate course exists
            if (course == null)
                return new ApiResponse<CourseDto>(false, "Course not found");

            // Business logic: Convert to DTO using mapper
            var courseDto = _mapper.Map<CourseDto>(course);

            return new ApiResponse<CourseDto>(true, "Course details retrieved successfully", courseDto);
        }

        public async Task<CourseRecommendationsResponse> SearchCoursesAsync(CourseSearchRequest request)
        {
            // Business logic: Get search count for pagination
            var totalCount = await _courseRepository.GetSearchCountAsync(
                request.SearchTerm,
                request.Category,
                request.MinPrice,
                request.MaxPrice,
                request.MinRating,
                request.Instructor);

            var totalPages = CalculateTotalPages(totalCount, request.PageSize);

            // Repository handles complex search query
            var courses = await _courseRepository.SearchCoursesAsync(
                request.SearchTerm,
                request.Category,
                request.MinPrice,
                request.MaxPrice,
                request.MinRating,
                request.Instructor,
                request.Page,
                request.PageSize);

            // Business logic: Convert to DTOs using mapper
            var results = _mapper.Map<List<CourseRecommendationDto>>(courses);

            // Business logic: Apply sorting
            results = ApplySorting(results, request.SortBy, request.SortOrder);

            return new CourseRecommendationsResponse(
                true,
                "Search completed successfully",
                results,
                totalCount,
                request.Page,
                totalPages
            );
        }

        // Business logic helper methods
        private int CalculateTotalPages(int totalCount, int pageSize)
        {
            return (int)Math.Ceiling(totalCount / (double)pageSize);
        }

        private List<CourseRecommendationDto> ApplySorting(
            List<CourseRecommendationDto> courses, 
            string? sortBy, 
            string sortOrder)
        {
            return sortBy?.ToLower() switch
            {
                "price" => sortOrder == "desc"
                    ? courses.OrderByDescending(c => c.Price).ToList()
                    : courses.OrderBy(c => c.Price).ToList(),
                "name" => sortOrder == "desc"
                    ? courses.OrderByDescending(c => c.CourseName).ToList()
                    : courses.OrderBy(c => c.CourseName).ToList(),
                _ => sortOrder == "desc"
                    ? courses.OrderByDescending(c => c.RecommendationScore).ToList()
                    : courses.OrderBy(c => c.RecommendationScore).ToList()
            };
        }

        private List<CourseRecommendationDto> ApplyPersonalizedScoring(
            List<CourseRecommendationDto> recommendations, 
            List<Course> originalCourses)
        {
            var scoredRecommendations = new List<CourseRecommendationDto>();

            foreach (var recommendation in recommendations)
            {
                var originalCourse = originalCourses.First(c => c.Id == recommendation.Id);
                var personalizedScore = CalculatePersonalizedScore(originalCourse);

                scoredRecommendations.Add(recommendation with { RecommendationScore = personalizedScore });
            }

            return scoredRecommendations;
        }

        private decimal CalculatePersonalizedScore(Course course)
        {
            // Business logic: Personalized scoring algorithm
            var baseScore = course.Rating ?? 0;
            var recommendedBonus = course.IsRecommended ? 2.0m : 0;
            return baseScore * 1.5m + recommendedBonus;
        }
    }
}
