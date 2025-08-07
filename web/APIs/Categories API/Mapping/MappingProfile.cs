using AutoMapper;
using IBSRA.Models;
using IBSRA.DTOs;
using System.Linq;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace IBSRA.Mapping
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Category, CategorySummaryDto>();
            CreateMap<Category, CategoryDetailsDto>()
                .AfterMap((src, dest, context) =>
                {
                    // Map popular courses using AutoMapper instead of manual mapping
                    dest.PopularCourses = context.Mapper.Map<List<CourseDto>>(
                        src.Courses?.OrderByDescending(c => c.Rating).Take(5).ToList() ?? new List<Course>()
                    );
                });
            CreateMap<Course, CourseDto>();
        }
    }
}
