using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Movies;

namespace BookingCinema.Pages.Admin.Movies
{
    public class DeleteModel(IMovieRepository repo) : PageModel
    {
        private readonly IMovieRepository _repository = repo;

        [BindProperty]
        public Movie? Movie { get; set; }

        public async Task<IActionResult> OnGet(int id)
        {
            Movie = await _repository.GetAsync(id);
            return Page();
        }

        public async Task<IActionResult> OnPost(int id)
        {
            await _repository.DeleteAsync(id);
            return RedirectToPage("/Admin/Movies/Index");
        }
    }
}
