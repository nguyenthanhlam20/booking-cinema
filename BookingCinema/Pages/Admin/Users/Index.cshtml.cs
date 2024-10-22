using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Users;

namespace BookingCinema.Pages.Admin.Users;
public class IndexModel : PageModel
{
    private readonly IUserRepository _repository;

    public IndexModel(IUserRepository repo)
    {
        _repository = repo;
    }

    public List<User> Users { get; set; } = new();

    public async Task<IActionResult> OnGetAsync()
    {
        Users = await _repository.ListAsync();
        return Page();
    }
}
