using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Movies;

namespace BookingCinema.Pages.Admin.Movies;
public class IndexModel(IMovieRepository repo) : PageModel
{
    private readonly IMovieRepository _repository = repo;
    public List<Movie> Movies { get; set; } = [];

    public async Task<IActionResult> OnGetAsync()
    {
        Movies = await _repository.ListAsync();
        return Page();
    }
}
