using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Users;

namespace BookingCinema.Pages.Admin.Users;
public class CreateModel : PageModel
{
    private readonly IUserRepository _repository;

    public CreateModel(IUserRepository repo)
    {
        _repository = repo;
    }

    [BindProperty]
    public User? UserModel { get; set; }

    public IActionResult OnGet() => Page();

    public async Task<IActionResult> OnPost()
    {
        if (UserModel == null) return Page();

        await _repository.InsertAsync(UserModel);
        return RedirectToPage("/Admin/Users/Index");
    }
}
