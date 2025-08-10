using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using IBSRA.Models;

namespace IBSRA.Repositories
{
    public interface ICategoryRepository
    {
        Task<IEnumerable<Category>> GetAllAsync();
        Task<Category> GetByIdAsync(int id);
        Task<Category> GetByNameAsync(string name);
        Task<IEnumerable<Category>> GetActiveCategoriesAsync();
        Task<IEnumerable<Category>> GetPopularCategoriesAsync(int count);
        Task<Category> AddAsync(Category entity);
        Task UpdateAsync(Category entity);
        Task DeleteAsync(int id);
        Task<int> CountAsync();
        Task<int> CountActiveAsync();
    }
}
