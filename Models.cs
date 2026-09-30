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

        // Pre-formatted display strings (kept out of the .aspx markup so the
        // inline <%# %> databinding expressions stay simple - concatenating
        // HTML entities + string literals directly inside a single-quoted
        // attribute is what was breaking the ASPX page compiler).
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
    // Kept separate from Salon (used on Default/guest home) since this page
    // needs a numeric Rating (for filtering/sorting) plus a services summary.
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
}