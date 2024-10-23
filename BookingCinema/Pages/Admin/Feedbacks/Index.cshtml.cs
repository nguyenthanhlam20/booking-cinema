using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace BookingCinema.Pages.Admin.Feedbacks
{
    public class IndexModel : PageModel
    {
        private readonly BusinessObjects.Models.CinemaContext _context;

        public IndexModel(BusinessObjects.Models.CinemaContext context)
        {
            _context = context;
        }

        public IList<Rating> Rating { get;set; }

        public async Task OnGetAsync()
        {
            Rating = await _context.Ratings
                .Include(r => r.Movie)
                .Include(r => r.User).ToListAsync();
        }
    }
}
