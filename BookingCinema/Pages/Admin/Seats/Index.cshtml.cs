using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Seats;

namespace BookingCinema.Pages.Admin.Seats;

public class IndexModel(ISeatRepository repo) : PageModel
{
    private readonly ISeatRepository _repository = repo;
    public List<Seat> Seats { get; set; } = [];

    public async Task<IActionResult> OnGetAsync()
    {
        Seats = await _repository.ListAsync();
        return Page();
    }
}
