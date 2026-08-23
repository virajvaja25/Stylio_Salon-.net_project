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
}
