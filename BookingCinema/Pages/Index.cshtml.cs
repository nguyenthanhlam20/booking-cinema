using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace BookingCinema.Pages;

public class IndexModel(ILogger<IndexModel> logger, CinemaContext context) : PageModel
{
    private readonly ILogger<IndexModel> _logger = logger;
    private readonly CinemaContext _context = context;

    public IList<Movie>? Movies { get; set; } // Danh sách các phim

    public async Task OnGetAsync()
    {
        // Lấy danh sách phim từ cơ sở dữ liệu và gán vào thuộc tính Movies
        Movies = await _context.Movies.ToListAsync();
    }
}
