using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Bookings;

namespace BookingCinema.Pages.Admin.SeatBookings;

public class IndexModel : PageModel
{
    private readonly IBookingRepository _repository;
    public IndexModel(IBookingRepository repo)
    {
        _repository = repo;
    }

    public List<SeatBooking> SeatBookings { get; set; } = new();

    public async Task<IActionResult> OnGetAsync()
    {
        SeatBookings = await _repository.ListAsync();
        return Page();
    }
}
