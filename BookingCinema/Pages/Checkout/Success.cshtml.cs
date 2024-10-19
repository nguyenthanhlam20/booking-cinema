using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BookingCinema.Pages.Checkout;

[Authorize]
public class SuccessModel : PageModel
{
    public IActionResult OnGetPaymentSuccess()
    {
        return RedirectToPage("Success");
    }
}
