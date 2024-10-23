using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using BusinessObjects.Models;

namespace BookingCinema.Pages.Admin.Theaters
{
    public class IndexModel : PageModel
    {
        private readonly BusinessObjects.Models.CinemaContext _context;

        public IndexModel(BusinessObjects.Models.CinemaContext context)
        {
            _context = context;
        }

        public IList<Theater> Theater { get;set; }

        public async Task OnGetAsync()
        {
            Theater = await _context.Theaters.ToListAsync();
        }
    }
}
