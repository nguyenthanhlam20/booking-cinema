using BusinessObjects.Models;

namespace Repositories;
public class BaseRepository
{
    protected readonly CinemaContext _context;
    public BaseRepository(CinemaContext context)
    {
        _context = context;
    }

}
