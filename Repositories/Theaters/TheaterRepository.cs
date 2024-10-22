using BusinessObjects.Models;
using Microsoft.EntityFrameworkCore;

namespace Repositories.Theaters;
public class TheaterRepository : BaseRepository, ITheaterRepository
{
    public TheaterRepository(CinemaContext context) : base(context) { }

    public async Task<List<Theater>> ListAsync()
        => await _context.Theaters.ToListAsync();
}
