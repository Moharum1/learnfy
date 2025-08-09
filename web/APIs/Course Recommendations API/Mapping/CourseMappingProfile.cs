using AutoMapper;
using YourApp.Models;
using YourApp.Models.DTOs;

namespace YourApp.Mapping
{
    public class CourseMappingProfile : Profile
    {
        public CourseMappingProfile()
        {
            // Course to CourseDto mapping
            CreateMap<Course, CourseDto>();

            // Course to CourseRecommendationDto mapping with custom RecommendationScore logic
            CreateMap<Course, CourseRecommendationDto>()
                .ForMember(dest => dest.RecommendationScore, opt => opt.MapFrom(src =>
                    src.IsRecommended ? (src.Rating ?? 0) * 1.2m : (src.Rating ?? 0)));
        }
    }
}
