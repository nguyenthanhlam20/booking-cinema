using BusinessObjects.Models;
using Microsoft.EntityFrameworkCore;

namespace Repositories.Showtimes;
public class ShowtimeRepository(CinemaContext context) : BaseRepository(context), IShowtimeRepository
{
    public async Task<List<Showtime>> ListAsync()
        => await _context.Showtimes.ToListAsync();
}
