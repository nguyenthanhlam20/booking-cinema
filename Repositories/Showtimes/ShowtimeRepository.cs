using BusinessObjects.Models;
using Microsoft.EntityFrameworkCore;

namespace Repositories.Showtimes;
public class ShowtimeRepository : BaseRepository, IShowtimeRepository
{

    public ShowtimeRepository(CinemaContext context) : base(context) { }

    public async Task<List<Showtime>> ListAsync()
        => await _context.Showtimes.ToListAsync();
}
