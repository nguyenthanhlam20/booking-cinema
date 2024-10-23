using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using BusinessObjects.Models;

namespace BookingCinema.Pages.Admin.ShowTimes
{
    public class CreateModel : PageModel
    {
        private readonly BusinessObjects.Models.CinemaContext _context;

        public CreateModel(BusinessObjects.Models.CinemaContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
        ViewData["MovieId"] = new SelectList(_context.Movies, "MovieId", "Title");
        ViewData["TheaterId"] = new SelectList(_context.Theaters, "TheaterId", "TheaterName");
            return Page();
        }

        [BindProperty]
        public Showtime Showtime { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Showtimes.Add(Showtime);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
