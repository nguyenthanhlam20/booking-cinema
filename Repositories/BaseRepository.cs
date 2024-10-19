using BusinessObjects.Models;

namespace Repositories;
public class BaseRepository(CinemaContext context)
{
    protected readonly CinemaContext _context = context;
}
