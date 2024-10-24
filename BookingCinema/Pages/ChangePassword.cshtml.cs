using BookingCinema.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Users;
using System.ComponentModel.DataAnnotations;
using System.Security.Claims;

namespace BookingCinema.Pages;

public class ChangePasswordModel : PageModel
{
    private readonly IUserRepository _repo;
    private readonly IEmailService _service;
    private readonly IHttpContextAccessor _httpContextAccessor;

    public ChangePasswordModel(IUserRepository repo, IEmailService service, IHttpContextAccessor httpContextAccessor)
    {
        _repo = repo;
        _service = service;
        _httpContextAccessor = httpContextAccessor;
    }

    public string? Message { get; set; }

    [BindProperty]
    [Required(ErrorMessage = "Please enter your new password")]
    public string? NewPassword { get; set; }

    [BindProperty]
    [Required(ErrorMessage = "Please enter confirm your new password")]
    [Compare("NewPassword", ErrorMessage = "The password and confirmation password do not match.")]
    public string? ConfirmPassword { get; set; }

    public IActionResult OnGet(string message)
    {
        Message = message;
        return Page();
    }

    public async Task<IActionResult> OnPostAsync()
    {
        if (!ModelState.IsValid) return Page();

        var email = GetUserEmail();

        if (string.IsNullOrEmpty(email))
        {
            ModelState.AddModelError("LoginError", "User email not exist");
            return Page();
        }

        var existingUser = await _repo.GetByEmailAsync(email);

        if (existingUser == null)
        {
            ModelState.AddModelError("LoginError", "User not exist");
            return Page();
        }

        await _repo.ChangePasswordAsync(email, NewPassword!);
        await _service.SendEmailAsync(email, "Cinema - Change Password", "You have successfully updated your password: " + NewPassword);

        TempData["Message"] = "An email with new password is sent to your email!";
        return RedirectToPage("/Login");
    }

    private string GetUserEmail()
    {
        if (_httpContextAccessor!.HttpContext!.User.Identity is ClaimsIdentity identity && identity.IsAuthenticated)
        {
            var claim = identity.FindFirst(ClaimTypes.Email);

            if (claim != null)
            {
                return claim.Value;
            }
        }

        return string.Empty;
    }

}
