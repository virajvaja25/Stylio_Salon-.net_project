using System;

namespace Stylio_Salon
{
    // ---------------- Shared data models ----------------
    // These are used by both Default.aspx.cs (logged-in home) and guest.aspx.cs (guest home).
    // They must be defined in EXACTLY ONE file, or you get "ambiguous reference" /
    // "namespace already contains a definition" compiler errors.

    public class Salon
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Rating { get; set; }
        public string Location { get; set; }
        public string ImageUrl { get; set; }

        public string RatingDisplay
        {
            get { return "\u2605 " + Rating; }
        }

        public string LocationDisplay
        {
            get { return "\U0001F4CD " + Location; }
        }
    }

    public class Service
    {
        public string Name { get; set; }
        public string IconUrl { get; set; }
    }

    public class Review
    {
        public string Name { get; set; }
        public string Comment { get; set; }
        public string AvatarUrl { get; set; }
    }

    public class SalonServiceItem
    {
        public string Name { get; set; }
        public string Duration { get; set; }
        public string Price { get; set; }
    }

    // Used by Salons.aspx.cs (the filterable salon listing page).
    public class SalonListItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public double Rating { get; set; }
        public string Location { get; set; }
        public string ServicesText { get; set; }
        public string ImageUrl { get; set; }

        public string RatingDisplay
        {
            get { return "\u2605 " + Rating.ToString("0.0"); }
        }

        public string LocationDisplay
        {
            get { return "\U0001F4CD " + Location; }
        }
    }

    public class ServiceCatalogItem
    {
        public string Name { get; set; }
        public string Category { get; set; }
        public string Description { get; set; }
        public string Duration { get; set; }
        public string PriceRange { get; set; }
        public string IconUrl { get; set; }
    }

    public class Appointment
    {
        public int Id { get; set; }
        public string SalonName { get; set; }
        public string ServiceName { get; set; }
        public string Date { get; set; }
        public string TimeSlot { get; set; }
        public string CustomerName { get; set; }
        public string CustomerPhone { get; set; }
        public string CustomerEmail { get; set; }
        public string Notes { get; set; }
    }

    public class BookingServiceItem
    {
        public string Name { get; set; }
        public int Price { get; set; }
        public string PriceDisplay
        {
            get { return "₹" + Price; }
        }
    }

    public class BookingRecord
    {
        public int BookingId { get; set; }
        public int UserId { get; set; }
        public int SalonId { get; set; }
        public string SalonName { get; set; }
        public string SalonImage { get; set; }
        public string Services { get; set; }
        public string Service
        {
            get { return Services; }
            set { Services = value; }
        }
        public DateTime BookingDate { get; set; }
        public TimeSpan BookingTime { get; set; }
        public string BookingDateStr { get; set; }
        public string BookingTimeStr { get; set; }
        public decimal TotalAmount { get; set; }
        public string AmountStr { get; set; }
        public string CustomerName { get; set; }
        public string CustomerEmail { get; set; }
        public string Status { get; set; }
        public string StatusDisplay { get; set; }
        public string StatusCssClass { get; set; }
        public string AvatarUrl { get; set; }
    }

    public class UserRecord
    {
        public int UserId { get; set; }
        public string Name { get; set; }
        public string FullName
        {
            get { return string.IsNullOrEmpty(Name) ? "User" : Name; }
            set { Name = value; }
        }
        public string Email { get; set; }
        public string MobileNumber { get; set; }
        public string Phone
        {
            get { return string.IsNullOrEmpty(MobileNumber) ? "—" : MobileNumber; }
            set { MobileNumber = value; }
        }
        public string Role { get; set; }
        public string AvatarUrl { get; set; }
        public string Status { get; set; }
        public string StatusCssClass { get; set; }
        public string JoinedOn { get; set; }
    }
}
