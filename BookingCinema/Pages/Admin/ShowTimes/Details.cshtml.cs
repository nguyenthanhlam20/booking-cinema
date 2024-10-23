using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using BusinessObjects.Models;

namespace BookingCinema.Pages.Admin.ShowTimes
{
    public class DetailsModel : PageModel
    {
        private readonly BusinessObjects.Models.CinemaContext _context;

        public DetailsModel(BusinessObjects.Models.CinemaContext context)
        {
            _context = context;
        }

        public Showtime Showtime { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Showtime = await _context.Showtimes
                .Include(s => s.Movie)
                .Include(s => s.Theater).FirstOrDefaultAsync(m => m.ShowtimeId == id);

            if (Showtime == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
