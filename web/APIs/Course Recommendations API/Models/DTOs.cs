namespace YourApp.Models.DTOs
{
    public record CourseDto(
        int Id,
        string CourseName,
        string Category,
        string? ImageUrl,
        string? Description,
        string? Instructor,
        string? Duration,
        decimal? Rating,
        decimal? Price,
        bool IsRecommended
    );

    public record CourseRecommendationDto(
        int Id,
        string CourseName,
        string Category,
        string? ImageUrl,
        string? Description,
        string? Instructor,
        string? Duration,
        decimal? Rating,
        decimal? Price,
        decimal RecommendationScore
    );

    public record CourseSearchRequest(
        string? SearchTerm = null,
        string? Category = null,
        decimal? MinPrice = null,
        decimal? MaxPrice = null,
        decimal? MinRating = null,
        string? Instructor = null,
        int Page = 1,
        int PageSize = 10,
        string SortBy = "rating",
        string SortOrder = "desc"
    );

    public record CourseRecommendationsResponse(
        bool Success,
        string Message,
        List<CourseRecommendationDto> Recommendations,
        int TotalCount,
        int CurrentPage,
        int TotalPages
    );

    public record ApiResponse<T>(bool Success, string Message, T? Data = default);
}
