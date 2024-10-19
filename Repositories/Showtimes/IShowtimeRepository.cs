using BusinessObjects.Models;

namespace Repositories.Showtimes;
public interface IShowtimeRepository
{
    Task<List<Showtime>> ListAsync();

}
