using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using IBSRA.DTOs;
using IBSRA.Repositories;

namespace IBSRA.Services
{
    public interface ICategoryService
    {
        Task<ApiResponse<List<CategorySummaryDto>>> GetAllCategoriesAsync(bool includeInactive = false);
        Task<ApiResponse<List<CategorySummaryDto>>> GetPopularCategoriesAsync(int count = 5);
        Task<ApiResponse<CategoryDetailsDto>> GetCategoryByIdAsync(int id);
        Task<ApiResponse<CategoryDetailsDto>> GetCategoryByNameAsync(string name);
    }

    public class CategoryService : ICategoryService
    {
        private readonly ICategoryRepository _categoryRepository;
        private readonly IMapper _mapper;

        public CategoryService(ICategoryRepository categoryRepository, IMapper mapper)
        {
            _categoryRepository = categoryRepository;
            _mapper = mapper;
        }

        public async Task<ApiResponse<List<CategorySummaryDto>>> GetAllCategoriesAsync(bool includeInactive = false)
        {
            var categories = includeInactive
                ? await _categoryRepository.GetAllAsync()
                : await _categoryRepository.GetActiveCategoriesAsync();

            var categoryDtos = _mapper.Map<List<CategorySummaryDto>>(categories);

            return new ApiResponse<List<CategorySummaryDto>>
            {
                Success = true,
                Message = "Categories retrieved successfully",
                Data = categoryDtos,
                TotalCount = categoryDtos.Count
            };
        }

        public async Task<ApiResponse<List<CategorySummaryDto>>> GetPopularCategoriesAsync(int count = 5)
        {
            count = count <= 0 || count > 20 ? 5 : count;

            var categories = await _categoryRepository.GetPopularCategoriesAsync(count);
            var categoryDtos = _mapper.Map<List<CategorySummaryDto>>(categories);

            return new ApiResponse<List<CategorySummaryDto>>
            {
                Success = true,
                Message = "Popular categories retrieved successfully",
                Data = categoryDtos
            };
        }

        public async Task<ApiResponse<CategoryDetailsDto>> GetCategoryByIdAsync(int id)
        {
            var category = await _categoryRepository.GetByIdAsync(id);

            if (category == null)
            {
                return new ApiResponse<CategoryDetailsDto>
                {
                    Success = false,
                    Message = "Category not found"
                };
            }

            // Use AutoMapper to handle the entire mapping including PopularCourses
            var categoryDto = _mapper.Map<CategoryDetailsDto>(category);

            return new ApiResponse<CategoryDetailsDto>
            {
                Success = true,
                Message = "Category retrieved successfully",
                Data = categoryDto
            };
        }

        public async Task<ApiResponse<CategoryDetailsDto>> GetCategoryByNameAsync(string name)
        {
            var category = await _categoryRepository.GetByNameAsync(name);

            if (category == null)
            {
                return new ApiResponse<CategoryDetailsDto>
                {
                    Success = false,
                    Message = "Category not found"
                };
            }

            // Use AutoMapper to handle the entire mapping including PopularCourses
            var categoryDto = _mapper.Map<CategoryDetailsDto>(category);

            return new ApiResponse<CategoryDetailsDto>
            {
                Success = true,
                Message = "Category retrieved successfully",
                Data = categoryDto
            };
        }
    }
}