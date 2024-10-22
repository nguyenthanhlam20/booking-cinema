using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Users;

namespace BookingCinema.Pages.Admin.Users;
public class UpdateModel : PageModel
{
    private readonly IUserRepository _repository;

    public UpdateModel(IUserRepository repo)
    {
        _repository = repo;
    }

    [BindProperty]
    public User? UserModel { get; set; }
    public async Task<IActionResult> OnGet(int id)
    {
        UserModel = await _repository.GetAsync(id);
        return Page();
    }

    public async Task<IActionResult> OnPost()
    {
        if (UserModel == null) return Page();

        await _repository.UpdateAsync(UserModel);
        return RedirectToPage("/Admin/Users/Index");
    }
}
