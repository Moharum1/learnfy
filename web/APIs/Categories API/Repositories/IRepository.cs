using IBSRA.Models;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace IBSRA.Repositories
{
    public interface IRepository<T> where T : class
    {
        Task<IEnumerable<T>> GetAllAsync();
        Task<T> GetByIdAsync(int id);
        Task<IEnumerable<T>> FindAsync(Expression<Func<T, bool>> predicate);
        Task<T> AddAsync(T entity);
        Task UpdateAsync(T entity);
        Task DeleteAsync(int id);
        Task<int> CountActiveAsync();
        Task<int> CountAsync(Expression<Func<T, bool>> predicate = null);
    }

    public interface ICategoryRepository : IRepository<Category>
    {
        Task<IEnumerable<Category>> GetPopularCategoriesAsync(int count);
        Task<Category> GetByNameAsync(string name);
        Task<IEnumerable<Category>> GetActiveCategoriesAsync();
    }

}
