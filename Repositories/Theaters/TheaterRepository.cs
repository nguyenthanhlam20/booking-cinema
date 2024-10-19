using BusinessObjects.Models;
using Microsoft.EntityFrameworkCore;

namespace Repositories.Theaters;
public class TheaterRepository(CinemaContext context) : BaseRepository(context), ITheaterRepository
{
    public async Task<List<Theater>> ListAsync()
        => await _context.Theaters.ToListAsync();
}
