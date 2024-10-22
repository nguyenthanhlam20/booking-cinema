using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Repositories.Bookings;
using Repositories.Seats;
using Repositories.Showtimes;
using Repositories.Users;

namespace BookingCinema.Pages.Admin.SeatBookings;

public class UpdateModel : PageModel
{
    private readonly IBookingRepository _repository;
    private readonly ISeatRepository _seatRepo;
    private readonly IShowtimeRepository _showtimeRepo;
    private readonly IUserRepository _userRepo;

    public UpdateModel(
    IBookingRepository repo,
    ISeatRepository seatRepo,
    IShowtimeRepository showtimeRepo,
    IUserRepository userRepo)
    {
        _repository = repo;
        _seatRepo = seatRepo;
        _showtimeRepo = showtimeRepo;
        _userRepo = userRepo;

    }

    [BindProperty]
    public SeatBooking? SeatBooking { get; set; }

    public SelectList? Seats { get; set; }

    public SelectList? Users { get; set; }

    public SelectList? Showtimes { get; set; }

    public async Task<IActionResult> OnGet(int id)
    {
        SeatBooking = await _repository.GetAsync(id);

        var seats = await _seatRepo.ListAsync();
        Seats = new SelectList(seats, "SeatId", "SeatName", SeatBooking!.SeatId);

        var users = await _userRepo.ListAsync();
        Users = new SelectList(users, "UserId", "FullName", SeatBooking!.UserId);

        var showtimes = await _showtimeRepo.ListAsync();
        Showtimes = new SelectList(showtimes, "ShowtimeId", "ShowDateTime", SeatBooking!.ShowtimeId);


        return Page();
    }

    public async Task<IActionResult> OnPost()
    {
        if (SeatBooking == null) return Page();
        await _repository.UpdateAsync(SeatBooking);
        return RedirectToPage("/Admin/SeatBookings/Index");
    }
}
