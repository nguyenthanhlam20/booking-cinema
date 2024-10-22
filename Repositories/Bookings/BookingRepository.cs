using BusinessObjects.Models;
using Microsoft.EntityFrameworkCore;

namespace Repositories.Bookings;
public class BookingRepository : BaseRepository, IBookingRepository
{
    public BookingRepository(CinemaContext context) : base(context) { }

    public async Task<bool> AnyAsync(int id)
        => await _context.SeatBookings.AnyAsync(x => x.BookingId == id);

    public async Task DeleteAsync(int id)
    {
        var exist = await _context.SeatBookings.FirstOrDefaultAsync(x => x.BookingId == id);

        if (exist != null)
        {
            var seat = await _context.Seats.FindAsync(exist.SeatId);
            if (seat != null)
            {
                seat.IsBooked = false;
            }

            _context.SeatBookings.Remove(exist);
            await _context.SaveChangesAsync();
        }
    }

    public async Task<SeatBooking?> GetAsync(int id)
        => await _context.SeatBookings
                .Include(s => s.Seat)
                .Include(s => s.Showtime)
                .Include(s => s.User)
                .FirstOrDefaultAsync(m => m.BookingId == id);

    public async Task InsertAsync(SeatBooking entity)
    {
        _context.SeatBookings.Add(entity);
        await _context.SaveChangesAsync();
    }

    public async Task<List<SeatBooking>> ListAsync()
        => await _context.SeatBookings
                    .Include(s => s.Seat)
                    .Include(s => s.Showtime)
                    .Include(s => s.User)
                    .ToListAsync();

    public async Task UpdateAsync(SeatBooking entity)
    {
        var exist = await _context.SeatBookings.FirstOrDefaultAsync(x => x.BookingId == entity.BookingId);

        if (exist != null)
        {
            exist.Showtime = entity.Showtime;
            exist.UserId = entity.UserId;
            exist.SeatId = entity.SeatId;
            exist.BookingDate = entity.BookingDate;
            await _context.SaveChangesAsync();
        }
    }
}
