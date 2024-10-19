using BusinessObjects.Models;

namespace Repositories.Users;
public interface IUserRepository
{
    Task<List<User>> ListAsync();
    Task<bool> AnyAsync(int id);
    Task<User?> GetAsync(int id);
    Task<User?> GetByEmailAsync(string email);
    Task InsertAsync(User entity);
    Task UpdateAsync(User entity);
    Task DeleteAsync(int id);
}
