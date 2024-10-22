using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Repositories.Seats;
using Repositories.Theaters;

namespace BookingCinema.Pages.Admin.Seats;
public class CreateModel : PageModel
{
    private readonly ISeatRepository _repository;
    private readonly ITheaterRepository _theaterRepo;
    public CreateModel(
        ISeatRepository repo,
        ITheaterRepository theaterRepo)
    {
        _repository = repo;
        _theaterRepo = theaterRepo;
    }

    [BindProperty]
    public Seat? Seat { get; set; }

    public SelectList? Theaters { get; set; }

    public async Task<IActionResult> OnGet()
    {
        var theaters = await _theaterRepo.ListAsync();
        Theaters = new SelectList(theaters, "TheaterId", "TheaterName");
        return Page();
    }

    public async Task<IActionResult> OnPost()
    {
        if (Seat == null) return Page();

        await _repository.InsertAsync(Seat);
        return RedirectToPage("/Admin/Seats/Index");
    }
}
