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
    public class IndexModel : PageModel
    {
        private readonly BusinessObjects.Models.CinemaContext _context;

        public IndexModel(BusinessObjects.Models.CinemaContext context)
        {
            _context = context;
        }

        public IList<Showtime> Showtime { get;set; }

        public async Task OnGetAsync()
        {
            Showtime = await _context.Showtimes
                .Include(s => s.Movie)
                .Include(s => s.Theater).ToListAsync();
        }
    }
}
