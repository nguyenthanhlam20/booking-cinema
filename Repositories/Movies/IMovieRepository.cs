using BusinessObjects.Models;

namespace Repositories.Movies;
public interface IMovieRepository
{
    Task<List<Movie>> ListAsync();
    Task<bool> AnyAsync(int id);
    Task<Movie?> GetAsync(int id);
    Task InsertAsync(Movie entity);
    Task UpdateAsync(Movie entity);
    Task DeleteAsync(int id);
}
