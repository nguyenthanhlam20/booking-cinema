﻿using BookingCinema.Models;
using BookingCinema.Services;
using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace BookingCinema.Pages;

public class CheckoutModel : PageModel
{
    private readonly CinemaContext _context;
    private readonly IVnPayService _vnPayservice;
    private readonly IHttpContextAccessor _httpContextAccessor;


    public CheckoutModel(IVnPayService vnPayservice, IHttpContextAccessor httpContextAccessor, CinemaContext context)
    {
        _context = context;
        _vnPayservice = vnPayservice;
        _httpContextAccessor = httpContextAccessor;
    }


    // Define TotalPrice property to hold the value from the URL
    public decimal? TotalPrice { get; private set; }

    public IList<SeatBooking>? SeatBookings { get; set; } // Danh sách các vé đã đặt


    // Handler for GET requests
    public async Task<IActionResult> OnGet(int discount = 0)
    {
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

        var prize = SeatBookings?.Sum(item => item.Seat!.Price);
        TotalPrice = prize - (prize * discount / 100);

        return Page();
    }

    public async Task<IActionResult> OnPostCheckoutAsync()
    {
        // Get the user ID
        int userId = GetUserId();

        // Redirect to login page if user is not authenticated
        if (userId == 0)
        {
            return RedirectToPage("/Login", "/Home");
        }

        // Lấy tổng giá vé đã đặt
        decimal totalPrice = await _context.SeatBookings
            .Where(sb => sb.UserId == userId)
            .SumAsync(sb => sb.Seat!.Price ?? 0);

        // Ép kiểu từ decimal sang double
        double amount = (double)(totalPrice * 1);

        // Create VnPaymentRequestModel
        var vnPayModel = new VnPaymentRequestModel
        {
            Amount = amount, // Sử dụng giá trị đã ép kiểu
            CreatedDate = DateTime.Now,
            Description = "Dữ liệu mô phỏng",
            FullName = "Nguyễn Cao Triều",
            OrderId = new Random().Next(1000, 100000)
        };

        // Send payment request to VNPay and redirect to VNPay's payment URL
        return Redirect(_vnPayservice.CreatePaymentUrl(HttpContext, vnPayModel));
    }

    // Helper method to get user ID
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
