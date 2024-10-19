using BusinessObjects.Models;
using Microsoft.EntityFrameworkCore;

namespace Repositories.Seats;
public class SeatRepository(CinemaContext context) : BaseRepository(context), ISeatRepository
{
    public async Task<bool> AnyAsync(int id)
        => await _context.Seats.AnyAsync(x => x.SeatId == id);

    public async Task DeleteAsync(int id)
    {
        var exist = await _context.Seats.FirstOrDefaultAsync(x => x.SeatId == id);

        if (exist != null)
        {
            _context.Seats.Remove(exist);
            await _context.SaveChangesAsync();
        }
    }

    public async Task<Seat?> GetAsync(int id)
        => await _context.Seats.Include(s => s.Theater).FirstOrDefaultAsync(m => m.SeatId == id);

    public async Task InsertAsync(Seat entity)
    {
        _context.Seats.Add(entity);
        await _context.SaveChangesAsync();
    }

    public async Task<List<Seat>> ListAsync()
        => await _context.Seats.Include(s => s.Theater).ToListAsync();

    public async Task UpdateAsync(Seat entity)
    {
        var exist = await _context.Seats.FirstOrDefaultAsync(x => x.SeatId == entity.SeatId);

        if (exist != null)
        {
            exist.NColumn = entity.NColumn;
            exist.NRow = entity.NRow;
            exist.TheaterId = entity.TheaterId;
            exist.Price = entity.Price;
            exist.IsBooked = entity.IsBooked;
            await _context.SaveChangesAsync();
        }
    }
}
