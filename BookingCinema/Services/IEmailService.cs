﻿namespace BookingCinema.Services;
public interface IEmailService
{
    Task SendEmailAsync(string email, string subject, string body);
}