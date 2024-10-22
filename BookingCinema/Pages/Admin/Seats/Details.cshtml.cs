using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Seats;

namespace BookingCinema.Pages.Admin.Seats
{
    public class DetailsModel : PageModel
    {
        private readonly ISeatRepository _repository;
        public DetailsModel(ISeatRepository repo)
        {
            _repository = repo;
        }

        [BindProperty]
        public Seat? Seat { get; set; }

        public async Task<IActionResult> OnGet(int id)
        {
            Seat = await _repository.GetAsync(id);
            return Page();
        }

        public async Task<IActionResult> OnPost(int id)
        {
            await _repository.DeleteAsync(id);
            return Page();
        }
    }
}
