using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using BusinessObjects.Models;

namespace BookingCinema.Pages.Admin.Theaters
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
            return Page();
        }

        [BindProperty]
        public Theater Theater { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Theaters.Add(Theater);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
