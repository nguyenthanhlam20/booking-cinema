using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BookingCinema.Pages.Admin.Home;

public class IndexModel : PageModel
{
    public IActionResult OnGet()
    {
        return Page();
    }
}
