using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using BusinessObjects.Models;

namespace BookingCinema.Pages.Admin.ShowTimes
{
    public class EditModel : PageModel
    {
        private readonly BusinessObjects.Models.CinemaContext _context;

        public EditModel(BusinessObjects.Models.CinemaContext context)
        {
            _context = context;
        }

        [BindProperty]
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
           ViewData["MovieId"] = new SelectList(_context.Movies, "MovieId", "Title");
           ViewData["TheaterId"] = new SelectList(_context.Theaters, "TheaterId", "TheaterName");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(Showtime).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ShowtimeExists(Showtime.ShowtimeId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool ShowtimeExists(int id)
        {
            return _context.Showtimes.Any(e => e.ShowtimeId == id);
        }
    }
}
