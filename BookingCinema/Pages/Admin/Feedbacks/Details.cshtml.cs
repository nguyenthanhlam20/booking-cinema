using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using BusinessObjects.Models;

namespace BookingCinema.Pages.Admin.Feedbacks
{
    public class DetailsModel : PageModel
    {
        private readonly BusinessObjects.Models.CinemaContext _context;

        public DetailsModel(BusinessObjects.Models.CinemaContext context)
        {
            _context = context;
        }

        public Rating Rating { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Rating = await _context.Ratings
                .Include(r => r.Movie)
                .Include(r => r.User).FirstOrDefaultAsync(m => m.RatingId == id);

            if (Rating == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
