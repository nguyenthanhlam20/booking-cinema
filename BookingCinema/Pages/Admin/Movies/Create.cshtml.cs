using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Movies;

namespace BookingCinema.Pages.Admin.Movies;
public class CreateModel : PageModel
{
    private readonly IMovieRepository _repository;

    public CreateModel(IMovieRepository repo)
    {
        _repository = repo;
    }

    [BindProperty]
    public Movie? Movie { get; set; }

    public IActionResult OnGet() => Page();

    public async Task<IActionResult> OnPost()
    {
        if (Movie == null) return Page();

        await _repository.InsertAsync(Movie);
        return RedirectToPage("/Admin/Movies/Index");
    }

}
