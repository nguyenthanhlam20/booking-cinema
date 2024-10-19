using BusinessObjects.Models;

namespace Repositories.Bookings;
public interface IBookingRepository
{
    Task<List<SeatBooking>> ListAsync();
    Task<bool> AnyAsync(int id);
    Task<SeatBooking?> GetAsync(int id);
    Task InsertAsync(SeatBooking entity);
    Task UpdateAsync(SeatBooking entity);
    Task DeleteAsync(int id);
}
