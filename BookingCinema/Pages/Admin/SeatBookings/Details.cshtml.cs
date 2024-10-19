using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Bookings;

namespace BookingCinema.Pages.Admin.SeatBookings
{
    public class DetailsModel(IBookingRepository repo) : PageModel
    {
        private readonly IBookingRepository _repository = repo;
        [BindProperty]
        public SeatBooking? SeatBooking { get; set; }

        public async Task<IActionResult> OnGet(int id)
        {
            SeatBooking = await _repository.GetAsync(id);
            return Page();
        }

        public async Task<IActionResult> OnPost(int id)
        {
            await _repository.DeleteAsync(id);
            return Page();
        }
    }
}