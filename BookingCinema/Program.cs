using BookingCinema.Services;
using BusinessObjects.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using Repositories.Bookings;
using Repositories.Movies;
using Repositories.Seats;
using Repositories.Showtimes;
using Repositories.Theaters;
using Repositories.Users;

var builder = WebApplication.CreateBuilder(args);
var connectionString = builder.Configuration.GetConnectionString("DB");

builder.Services.AddRazorPages();
builder.Services.AddDbContext<CinemaContext>(options =>
{
    options.UseSqlServer(connectionString);
});

builder.Services.AddHttpContextAccessor();

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.Cookie.Name = "YourCookieName";
        options.Cookie.HttpOnly = true;
        options.LoginPath = "/Login"; // Corrected login path
        options.ExpireTimeSpan = TimeSpan.FromMinutes(30); // Cookie expiration time
    });

// Require authorization for Admin folder
builder.Services.AddRazorPages(options =>
{
    options.Conventions.AuthorizeFolder("/Admin");
});

builder.Services.AddAuthorization();
builder.Services.AddSession();
builder.Services.AddSingleton<IVnPayService, VnPayService>();

builder.Services.Configure<EmailSettings>(builder.Configuration.GetSection("EmailSettings"));
builder.Services.AddSingleton<IEmailService, EmailService>();

builder.Services.AddTransient<IBookingRepository, BookingRepository>();
builder.Services.AddTransient<IMovieRepository, MovieRepository>();
builder.Services.AddTransient<IUserRepository, UserRepository>();
builder.Services.AddTransient<IBookingRepository, BookingRepository>();
builder.Services.AddTransient<IShowtimeRepository, ShowtimeRepository>();
builder.Services.AddTransient<ITheaterRepository, TheaterRepository>();
builder.Services.AddTransient<ISeatRepository, SeatRepository>();

var app = builder.Build();
if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseStaticFiles();
app.UseRouting();
app.UseHttpsRedirection();
app.UseAuthentication();
app.UseAuthorization();
app.UseSession();

app.MapRazorPages();
app.Run();
