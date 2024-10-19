using BusinessObjects.Models;

namespace Repositories.Theaters;
public interface ITheaterRepository
{
    Task<List<Theater>> ListAsync();
}
