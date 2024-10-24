using BookingCinema.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Users;

namespace BookingCinema.Pages;

public class ResetPasswordModel : PageModel
{
    private readonly IUserRepository _repo;
    private readonly IEmailService _service;

    public ResetPasswordModel(IUserRepository repo, IEmailService service)
    {
        _repo = repo;
        _service = service;
    }

    public string? Message { get; set; }

    [BindProperty]
    public string? Email { get; set; }

    public IActionResult OnGet(string message)
    {
        Message = message;
        return Page();
    }

    public async Task<IActionResult> OnPostAsync()
    {
        if (string.IsNullOrEmpty(Email))
        {
            ModelState.AddModelError("LoginError", "Please enter your email");
            return Page();
        }

        var existingUser = await _repo.GetByEmailAsync(Email!);

        if (existingUser == null)
        {
            ModelState.AddModelError("LoginError", "User not exist");
            return Page();
        }

        var newPassword = await _repo.ResetPasswordAsync(Email);

        await _service.SendEmailAsync(Email, "Cinema - Reset Password", "Your new password is: " + newPassword);

        TempData["Message"] = "An email with new password is sent to your email!";
        return RedirectToPage("/Login");
    }

}
