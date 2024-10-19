using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BookingCinema.Pages.Checkout;

public class PaymentFailModel : PageModel
{
    public IActionResult OnGetPaymentFail()
    {
        return Page();
    }
}
