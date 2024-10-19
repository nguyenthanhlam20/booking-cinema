using BusinessObjects.Models;
using Microsoft.EntityFrameworkCore;

namespace Repositories.Movies;
public class MovieRepository(CinemaContext context) : BaseRepository(context), IMovieRepository
{
    public async Task<bool> AnyAsync(int id)
        => await _context.Movies.AnyAsync(x => x.MovieId == id);

    public async Task DeleteAsync(int id)
    {
        var exist = await _context.Movies.FirstOrDefaultAsync(x => x.MovieId == id);

        if (exist != null)
        {
            _context.Movies.Remove(exist);
            await _context.SaveChangesAsync();
        }
    }

    public async Task<Movie?> GetAsync(int id)
        => await _context.Movies.FirstOrDefaultAsync(m => m.MovieId == id);

    public async Task InsertAsync(Movie entity)
    {
        _context.Movies.Add(entity);
        await _context.SaveChangesAsync();
    }

    public async Task<List<Movie>> ListAsync()
        => await _context.Movies.ToListAsync();

    public async Task UpdateAsync(Movie entity)
    {
        var exist = await _context.Movies.FirstOrDefaultAsync(x => x.MovieId == entity.MovieId);

        if (exist != null)
        {
            exist.Title = entity.Title;
            exist.Description = entity.Description;
            exist.Duration = entity.Duration;
            exist.Genre = entity.Genre;
            exist.Img = entity.Img;
            exist.Age = entity.Age;
            exist.ReleaseDate = entity.ReleaseDate;
            await _context.SaveChangesAsync();
        }
    }
}
