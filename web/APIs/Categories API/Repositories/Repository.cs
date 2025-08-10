using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using IBSRA.Data;
using IBSRA.Models;

namespace IBSRA.Repositories
{
    public class Repository : IRepository
    {
        protected readonly AppDbContext _context;

        public CategoryRepository(AppDbContext context)
        {
            _context = context;
        }

        public virtual async Task<IEnumerable<Category>> GetAllAsync()
        {
            return await _context.Categories
                .Include(c => c.Courses)
                .ToListAsync();
        }

        public virtual async Task<Category> GetByIdAsync(int id)
        {
            return await _context.Categories
                .Include(c => c.Courses)
                .FirstOrDefaultAsync(c => c.ID == id);
        }

        public async Task<Category> GetByNameAsync(string name)
        {
            return await _context.Categories
                .Include(c => c.Courses)
                .FirstOrDefaultAsync(c => c.Name == name);
        }

        public async Task<IEnumerable<Category>> GetActiveCategoriesAsync()
        {
            return await _context.Categories
                .Include(c => c.Courses)
                .Where(c => c.IsActive)
                .OrderBy(c => c.DisplayOrder)
                .ThenBy(c => c.Name)
                .ToListAsync();
        }

        public async Task<IEnumerable<Category>> GetPopularCategoriesAsync(int count)
        {
            return await _context.Categories
                .Include(c => c.Courses)
                .Where(c => c.IsActive)
                .OrderByDescending(c => c.Courses.Count)
                .Take(count)
                .ToListAsync();
        }

        public virtual async Task<Category> AddAsync(Category entity)
        {
            _context.Categories.Add(entity);
            await _context.SaveChangesAsync();
            return entity;
        }

        public virtual async Task UpdateAsync(Category entity)
        {
            _context.Entry(entity).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public virtual async Task DeleteAsync(int id)
        {
            var entity = await _context.Categories.FindAsync(id);
            if (entity != null)
            {
                _context.Categories.Remove(entity);
                await _context.SaveChangesAsync();
            }
        }

        public virtual async Task<int> CountAsync()
        {
            return await _context.Categories.CountAsync();
        }

        public virtual async Task<int> CountActiveAsync()
        {
            return await _context.Categories.CountAsync(c => c.IsActive);
        }
    }
}
