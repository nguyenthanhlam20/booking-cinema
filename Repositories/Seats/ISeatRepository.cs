using BusinessObjects.Models;

namespace Repositories.Seats;
public interface ISeatRepository
{
    Task<List<Seat>> ListAsync();
    Task<bool> AnyAsync(int id);
    Task<Seat?> GetAsync(int id);
    Task InsertAsync(Seat entity);
    Task UpdateAsync(Seat entity);
    Task DeleteAsync(int id);
}
