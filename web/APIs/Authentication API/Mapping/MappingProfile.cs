using AutoMapper;
using YourApp.Models;
using YourApp.Models.DTOs;

namespace YourApp.Mapping
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<User, UserDto>();
        }
    }
}