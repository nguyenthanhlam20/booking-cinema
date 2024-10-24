using BusinessObjects.Models;
using Microsoft.EntityFrameworkCore;
using System.Text;

namespace Repositories.Users;
public class UserRepository : BaseRepository, IUserRepository
{
    public UserRepository(CinemaContext context) : base(context) { }

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

    public string RandomPassword(int length)
    {
        const string uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        const string lowercase = "abcdefghijklmnopqrstuvwxyz";
        const string digits = "0123456789";
        const string specialChars = "!@#$%^&*()-_=+[]{}|;:,.<>?";

        var allChars = uppercase + lowercase + digits + specialChars;
        var password = new StringBuilder();
        var random = new Random();

        // Ensure password has at least one of each type of character
        password.Append(uppercase[random.Next(uppercase.Length)]);
        password.Append(lowercase[random.Next(lowercase.Length)]);
        password.Append(digits[random.Next(digits.Length)]);
        password.Append(specialChars[random.Next(specialChars.Length)]);

        // Fill the rest of the password length with random characters
        for (int i = 4; i < length; i++)
        {
            password.Append(allChars[random.Next(allChars.Length)]);
        }

        // Shuffle the result to avoid predictable patterns
        return ShuffleString(password.ToString(), random);
    }

    private static string ShuffleString(string input, Random random)
    {
        char[] array = input.ToCharArray();
        for (int i = array.Length - 1; i > 0; i--)
        {
            int j = random.Next(i + 1);
            (array[i], array[j]) = (array[j], array[i]);
        }
        return new string(array);
    }

    public async Task<string> ResetPasswordAsync(string email)
    {
        var exist = await _context.Users.FirstOrDefaultAsync(x => x.Email == email);

        if (exist != null)
        {
            var newPassword = RandomPassword(8);
            exist.Password = newPassword;
            await _context.SaveChangesAsync();
            return newPassword;
        }
        return "";
    }

    public async Task ChangePasswordAsync(string email, string newPassword)
    {
        var exist = await _context.Users.FirstOrDefaultAsync(x => x.Email == email);

        if (exist != null)
        {
            exist.Password = newPassword;
            await _context.SaveChangesAsync();
        }
    }
}
