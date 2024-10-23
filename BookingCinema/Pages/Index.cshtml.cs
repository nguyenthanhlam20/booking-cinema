using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace BookingCinema.Pages;

public class IndexModel : PageModel
{
    private readonly CinemaContext _context;

    public IndexModel(CinemaContext context)
    {
        _context = context;
    }

    public IList<Movie>? Movies { get; set; } // Danh sách các phim

    public IList<Movie>? UpComingMovies { get; set; } // Danh sách các phim


    public async Task OnGetAsync()
    {
        // Lấy danh sách phim từ cơ sở dữ liệu và gán vào thuộc tính Movies
        var movies = await _context.Movies.ToListAsync();

        Movies = movies.Where(x => x.ReleaseDate <= DateTime.Now).ToList();
        UpComingMovies = movies.Where(x => x.ReleaseDate >  DateTime.Now).ToList();
    }
}
