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
    public class DetailsModel : PageModel
    {
        private readonly BusinessObjects.Models.CinemaContext _context;

        public DetailsModel(BusinessObjects.Models.CinemaContext context)
        {
            _context = context;
        }

        public Theater Theater { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Theater = await _context.Theaters.FirstOrDefaultAsync(m => m.TheaterId == id);

            if (Theater == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
