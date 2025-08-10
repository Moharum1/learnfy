using System.Collections.Generic;
using System.Threading.Tasks;
using IBSRA.DTOs;

namespace IBSRA.Services
{
    public interface ICategoryService
    {
        Task<ApiResponse<List<CategorySummaryDto>>> GetAllCategoriesAsync(bool includeInactive = false);
        Task<ApiResponse<List<CategorySummaryDto>>> GetPopularCategoriesAsync(int count = 5);
        Task<ApiResponse<CategoryDetailsDto>> GetCategoryByIdAsync(int id);
        Task<ApiResponse<CategoryDetailsDto>> GetCategoryByNameAsync(string name);
    }
}
