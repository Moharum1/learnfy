using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using IBSRA.DTOs;
using IBSRA.Repositories;
using IBSRA.Models;
using System.Linq;

namespace IBSRA.Services
{
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
            // Repository handles data retrieval based on business logic condition
            var categories = includeInactive 
                ? await _categoryRepository.GetAllAsync()
                : await _categoryRepository.GetActiveCategoriesAsync();

            // Business logic: Convert to DTOs using mapper
            var categoryDtos = _mapper.Map<List<CategorySummaryDto>>(categories);

            // Business logic: Calculate count for response
            var totalCount = CalculateTotalCount(categoryDtos);

            return new ApiResponse<List<CategorySummaryDto>>
            {
                Success = true,
                Message = "Categories retrieved successfully",
                Data = categoryDtos,
                TotalCount = totalCount
            };
        }

        public async Task<ApiResponse<List<CategorySummaryDto>>> GetPopularCategoriesAsync(int count = 5)
        {
            // Business logic: Validate and normalize count parameter
            count = ValidateAndNormalizeCount(count);
            
            // Repository handles data retrieval
            var categories = await _categoryRepository.GetPopularCategoriesAsync(count);
            
            // Business logic: Convert to DTOs using mapper
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
            // Business logic: Validate ID parameter
            if (!IsValidId(id))
            {
                return CreateNotFoundResponse<CategoryDetailsDto>("Invalid category ID");
            }

            // Repository handles data retrieval
            var category = await _categoryRepository.GetByIdAsync(id);
            
            // Business logic: Check if category exists
            if (category == null)
            {
                return CreateNotFoundResponse<CategoryDetailsDto>("Category not found");
            }

            // Business logic: Convert to DTO with popular courses using mapper
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
            // Business logic: Validate name parameter
            if (!IsValidName(name))
            {
                return CreateNotFoundResponse<CategoryDetailsDto>("Invalid category name");
            }

            // Repository handles data retrieval
            var category = await _categoryRepository.GetByNameAsync(name);
            
            // Business logic: Check if category exists
            if (category == null)
            {
                return CreateNotFoundResponse<CategoryDetailsDto>("Category not found");
            }

            // Business logic: Convert to DTO with popular courses using mapper
            var categoryDto = _mapper.Map<CategoryDetailsDto>(category);

            return new ApiResponse<CategoryDetailsDto>
            {
                Success = true,
                Message = "Category retrieved successfully",
                Data = categoryDto
            };
        }

        // Business logic helper methods
        private int ValidateAndNormalizeCount(int count)
        {
            // Business rule: Count should be between 1 and 20, default to 5
            return count <= 0 || count > 20 ? 5 : count;
        }

        private bool IsValidId(int id)
        {
            // Business rule: ID must be positive
            return id > 0;
        }

        private bool IsValidName(string name)
        {
            // Business rule: Name must not be null or empty
            return !string.IsNullOrWhiteSpace(name);
        }

        private int CalculateTotalCount(List<CategorySummaryDto> categories)
        {
            // Business logic: Calculate total count from retrieved data
            return categories?.Count ?? 0;
        }

        private ApiResponse<T> CreateNotFoundResponse<T>(string message)
        {
            // Business logic: Create standardized error response
            return new ApiResponse<T>
            {
                Success = false,
                Message = message
            };
        }
    }
}
