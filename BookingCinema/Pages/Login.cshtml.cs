using BusinessObjects.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Users;
using System.Security.Claims;

namespace BookingCinema.Pages;

public class LoginModel(IUserRepository repo) : PageModel
{
    private readonly IUserRepository _repo = repo;

    public string? Message { get; set; }

    [BindProperty]
    public User? UserModel { get; set; }

    public IActionResult OnGet(string message)
    {
        Message = message;
        return Page();
    }

    public async Task<IActionResult> OnPostAsync()
    {
        var existingUser = await _repo.GetByEmailAsync(UserModel!.Email);

        if (existingUser == null)
        {
            ModelState.AddModelError("LoginError", "Không Đúng Mật Khẩu Hoặc Email");
            return Page();
        }

        if (existingUser.Password != UserModel.Password)
        {
            ModelState.AddModelError("LoginError", "Nhập Sai Mật Khẩu");
            return Page();
        }

        // If email and password are correct, proceed with authentication
        var claims = new List<Claim>
            {
                new (ClaimTypes.NameIdentifier, existingUser.UserId.ToString()),
                new (ClaimTypes.Name, existingUser.FullName ?? "")
            };

        if (existingUser.Role == "Admin")
        {
            claims.Add(new Claim(ClaimTypes.Role, "Admin"));
            await HttpContext.SignInAsync(new ClaimsPrincipal(new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme)));
            return RedirectToPage("Admin/Home/Index");
        }

        await HttpContext.SignInAsync(new ClaimsPrincipal(new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme)));
        TempData["Message"] = "Đăng Nhập Thành Công!";
        return RedirectToPage("/Index");
    }

}
