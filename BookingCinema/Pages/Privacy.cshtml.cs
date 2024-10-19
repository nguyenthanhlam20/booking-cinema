using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BookingCinema.Pages;

public class PrivacyModel(ILogger<PrivacyModel> logger) : PageModel
{
    private readonly ILogger<PrivacyModel> _logger = logger;
}
