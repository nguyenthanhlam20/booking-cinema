using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repositories.Users;
using System.Text.RegularExpressions;

namespace BookingCinema.Pages;

public class RegisterModel : PageModel
{
    private readonly IUserRepository _repo;

    public RegisterModel(IUserRepository repo)
    {
        _repo = repo;
    }
    public string? Message { get; set; }

    [BindProperty]
    public User? UserModel { get; set; }

    public IActionResult OnGet() => Page();

    public async Task<IActionResult> OnPost()
    {
        // Kiểm tra xem người dùng đã tồn tại hay chưa
        if (await _repo.GetByEmailAsync(UserModel!.Email) != null)
        {
            ModelState.AddModelError("User.Email", "Email Đã Có Rồi");
            return Page();
        }

        // Kiểm tra xem username có để trống hay không
        if (string.IsNullOrWhiteSpace(UserModel.Username))
        {
            ModelState.AddModelError("User.Username", "Username is required");
            return Page();
        }

        // Kiểm tra định dạng email
        if (!IsValidEmail(UserModel.Email))
        {
            ModelState.AddModelError("User.Email", "Invalid email format");
            return Page();
        }


        // Kiểm tra và gán giá trị mặc định cho IsAdmin và Role
        UserModel.Role = UserModel.Role ?? "khách";

        // Thêm người dùng mới vào cơ sở dữ liệu
        await _repo.InsertAsync(UserModel);
        Message = "Đăng Ký Thành Công! <i class=\"bi bi-emoji-smile-fill\"></i>";
        return RedirectToPage("/Login", new { message = Message });
    }

    private static bool IsValidEmail(string email)
    {
        // Sử dụng regular expression để kiểm tra định dạng email
        string pattern = @"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
        return Regex.IsMatch(email, pattern);
    }
}
