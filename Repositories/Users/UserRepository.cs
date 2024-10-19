using BusinessObjects.Models;
using Microsoft.EntityFrameworkCore;

namespace Repositories.Users;
public class UserRepository(CinemaContext context) : BaseRepository(context), IUserRepository
{
    public async Task<bool> AnyAsync(int id)
        => await _context.Users.AnyAsync(x => x.UserId == id);

    public async Task DeleteAsync(int id)
    {
        var exist = await _context.Users.FirstOrDefaultAsync(x => x.UserId == id);

        if (exist != null)
        {

            var bookings = await _context.SeatBookings.Where(x => x.UserId == id).ToListAsync();

            _context.SeatBookings.RemoveRange(bookings);
            _context.Users.Remove(exist);
            await _context.SaveChangesAsync();
        }
    }

    public async Task<User?> GetAsync(int id)
        => await _context.Users.FirstOrDefaultAsync(m => m.UserId == id);

    public async Task<User?> GetByEmailAsync(string email)
    => await _context.Users.FirstOrDefaultAsync(m => m.Email == email);

    public async Task InsertAsync(User entity)
    {
        _context.Users.Add(entity);
        await _context.SaveChangesAsync();
    }

    public async Task<List<User>> ListAsync()
        => await _context.Users.ToListAsync();

    public async Task UpdateAsync(User entity)
    {
        var exist = await _context.Users.FirstOrDefaultAsync(x => x.UserId == entity.UserId);

        if (exist != null)
        {
            exist.Username = entity.Username;
            exist.Role = entity.Role;
            exist.Email = entity.Email;
            exist.FullName = entity.FullName;
            exist.Password = entity.Password;

            await _context.SaveChangesAsync();
        }
    }
}
