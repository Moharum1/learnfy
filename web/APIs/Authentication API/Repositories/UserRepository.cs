using Microsoft.EntityFrameworkCore;
using YourApp.Data;
using YourApp.Models;

namespace YourApp.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly AppDbContext _context;

        public UserRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<User?> GetByEmailAsync(string email)
        {
            return await _context.Users
                .FirstOrDefaultAsync(u => u.Email == email);
        }

        public async Task<User?> GetByUsernameAsync(string username)
        {
            return await _context.Users
                .FirstOrDefaultAsync(u => u.Username == username);
        }

        public async Task<User?> GetByResetTokenAsync(string resetToken)
        {
            return await _context.Users
                .FirstOrDefaultAsync(u => 
                    u.ResetToken == resetToken && 
                    u.ResetTokenExpiry > DateTime.UtcNow);
        }

        public async Task<bool> EmailExistsAsync(string email)
        {
            return await _context.Users
                .AnyAsync(u => u.Email == email);
        }

        public async Task<bool> UsernameExistsAsync(string username)
        {
            return await _context.Users
                .AnyAsync(u => u.Username == username);
        }

        public async Task<bool> EmailOrUsernameExistsAsync(string email, string username)
        {
            return await _context.Users
                .AnyAsync(u => u.Email == email || u.Username == username);
        }

        public async Task<User> CreateAsync(User user)
        {
            _context.Users.Add(user);
            await _context.SaveChangesAsync();
            return user;
        }

        public async Task UpdateAsync(User user)
        {
            _context.Users.Update(user);
        }

        public async Task SaveChangesAsync()
        {
            await _context.SaveChangesAsync();
        }
    }
}
