﻿using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace BookingCinema.Pages;

public class ViewBookingsModel(ILogger<ViewBookingsModel> logger, CinemaContext context, IHttpContextAccessor httpContextAccessor) : PageModel
{
    private readonly ILogger<ViewBookingsModel> _logger = logger;
    private readonly CinemaContext _context = context;
    private readonly IHttpContextAccessor _httpContextAccessor = httpContextAccessor;

    public IList<SeatBooking>? SeatBookings { get; set; } // Danh sách các vé đã đặt

    public async Task OnGetAsync(int discount = 0)
    {
        // Lấy ID của người dùng đang đăng nhập
        int userId = GetUserId();
        // Lấy danh sách các vé đã đặt của người dùng từ cơ sở dữ liệu và gán vào thuộc tính SeatBookings
        SeatBookings = await _context.SeatBookings
            .Where(sb => sb.UserId == userId)
            .Include(sb => sb.Showtime)
                .ThenInclude(s => s!.Movie) // Kết hợp với bảng Movie
            .Include(sb => sb.Showtime)
                .ThenInclude(s => s!.Theater)
                    .ThenInclude(t => t!.Seats)
            .ToListAsync();
        ViewData["Discount"] = discount;    

    }
    public async Task<IActionResult> OnPostCancelBookingAsync(int bookingId)
    {
        // Tìm vé cần hủy trong cơ sở dữ liệu
        var booking = await _context.SeatBookings
            .Include(sb => sb.Seat)
            .FirstOrDefaultAsync(sb => sb.BookingId == bookingId);

        if (booking == null)
        {
            return NotFound();
        }

        // Xóa vé khỏi cơ sở dữ liệu
        _context.SeatBookings.Remove(booking);
        await _context.SaveChangesAsync();

        // Cập nhật trạng thái của ghế
        booking.Seat!.IsBooked = false; // Đặt lại trạng thái của ghế thành chưa đặt
        await _context.SaveChangesAsync();

        // Redirect lại trang để cập nhật danh sách vé
        return RedirectToPage();
    }

    // Hàm GetUserId() để lấy ID của người dùng đang đăng nhập
    private int GetUserId()
    {
        if (_httpContextAccessor!.HttpContext!.User.Identity is ClaimsIdentity identity && identity.IsAuthenticated)
        {
            var userIdClaim = identity.FindFirst(ClaimTypes.NameIdentifier);

            if (userIdClaim != null && int.TryParse(userIdClaim.Value, out int userId))
            {
                return userId;
            }
        }

        return 0;
    }
}
