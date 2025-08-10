using YourApp.Models;

namespace YourApp.Repositories
{
    public interface IUserRepository
    {
        Task<User?> GetByEmailAsync(string email);
        Task<User?> GetByUsernameAsync(string username);
        Task<User?> GetByResetTokenAsync(string resetToken);
        Task<bool> EmailExistsAsync(string email);
        Task<bool> UsernameExistsAsync(string username);
        Task<bool> EmailOrUsernameExistsAsync(string email, string username);
        Task<User> CreateAsync(User user);
        Task UpdateAsync(User user);
        Task SaveChangesAsync();
    }
}
