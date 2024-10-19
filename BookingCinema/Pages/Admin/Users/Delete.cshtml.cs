using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Users;

namespace BookingCinema.Pages.Admin.Users;
public class DeleteModel(IUserRepository repo) : PageModel
{
    private readonly IUserRepository _repository = repo;
    [BindProperty]
    public User? UserModel { get; set; }

    public async Task<IActionResult> OnGet(int id)
    {
        UserModel = await _repository.GetAsync(id);
        return Page();
    }

    public async Task<IActionResult> OnPost(int id)
    {
        await _repository.DeleteAsync(id);
        return RedirectToPage("/Admin/Users/Index");
    }
}
