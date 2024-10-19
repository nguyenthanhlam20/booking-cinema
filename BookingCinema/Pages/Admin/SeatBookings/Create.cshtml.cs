using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Repositories.Bookings;
using Repositories.Seats;
using Repositories.Showtimes;
using Repositories.Users;

namespace BookingCinema.Pages.Admin.SeatBookings;

public class CreateModel(
    IBookingRepository repo,
    ISeatRepository seatRepo,
    IShowtimeRepository showtimeRepo,
    IUserRepository userRepo) : PageModel
{
    private readonly IBookingRepository _repository = repo;
    private readonly ISeatRepository _seatRepo = seatRepo;
    private readonly IShowtimeRepository _showtimeRepo = showtimeRepo;
    private readonly IUserRepository _userRepo = userRepo;


    [BindProperty]
    public SeatBooking? SeatBooking { get; set; }

    public SelectList? Seats { get; set; }

    public SelectList? Users { get; set; }

    public SelectList? Showtimes { get; set; }

    public async Task<IActionResult> OnGet()
    {

        var seats = await _seatRepo.ListAsync();
        Seats = new SelectList(seats, "SeatId", "SeatName");

        var users = await _userRepo.ListAsync();
        Users = new SelectList(users, "UserId", "FullName");

        var showtimes = await _showtimeRepo.ListAsync();
        Showtimes = new SelectList(showtimes, "ShowtimeId", "ShowDateTime");

        return Page();
    }

    public async Task<IActionResult> OnPost()
    {
        if (SeatBooking == null) return Page();

        await _repository.InsertAsync(SeatBooking);
        return RedirectToPage("/Admin/SeatBookings/Index");
    }
}
