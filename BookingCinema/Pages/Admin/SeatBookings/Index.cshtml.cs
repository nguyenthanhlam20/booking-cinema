using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Bookings;

namespace BookingCinema.Pages.Admin.SeatBookings;

public class IndexModel(IBookingRepository repo) : PageModel
{
    private readonly IBookingRepository _repository = repo;
    public List<SeatBooking> SeatBookings { get; set; } = [];

    public async Task<IActionResult> OnGetAsync()
    {
        SeatBookings = await _repository.ListAsync();
        return Page();
    }
}
