using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Movies;

namespace BookingCinema.Pages.Admin.Movies
{
    public class DetailsModel : PageModel
    {
        private readonly IMovieRepository _repository;

        public DetailsModel(IMovieRepository repo)
        {
            _repository = repo;
        }



        [BindProperty]
        public Movie? Movie { get; set; }

        public async Task<IActionResult> OnGet(int id)
        {
            Movie = await _repository.GetAsync(id);
            return Page();
        }
    }
}
