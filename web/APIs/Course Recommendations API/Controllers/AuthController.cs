using Microsoft.AspNetCore.Mvc;
using YourApp.Models.DTOs;
using YourApp.Services;

namespace YourApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CourseController : ControllerBase
    {
        private readonly ICourseService _courseService;

        public CourseController(ICourseService courseService)
        {
            _courseService = courseService;
        }

        [HttpGet("recommendations")]
        public async Task<IActionResult> GetCourseRecommendations([FromQuery] CourseSearchRequest request)
        {
            var result = await _courseService.GetCourseRecommendationsAsync(request);
            return Ok(result);
        }

        [HttpGet("personalized/{userId}")]
        public async Task<IActionResult> GetPersonalizedRecommendations(int userId, [FromQuery] int count = 5)
        {
            var result = await _courseService.GetPersonalizedRecommendationsAsync(userId, count);
            return Ok(result);
        }

        [HttpGet("trending")]
        public async Task<IActionResult> GetTrendingCourses([FromQuery] int count = 10)
        {
            var result = await _courseService.GetTrendingCoursesAsync(count);
            return Ok(result);
        }

        [HttpGet("{courseId}")]
        public async Task<IActionResult> GetCourseById(int courseId)
        {
            var result = await _courseService.GetCourseByIdAsync(courseId);
            return Ok(result);
        }

        [HttpGet("search")]
        public async Task<IActionResult> SearchCourses([FromQuery] CourseSearchRequest request)
        {
            var result = await _courseService.SearchCoursesAsync(request);
            return Ok(result);
        }
    }
}
