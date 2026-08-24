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

    public class SalonListItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public double Rating { get; set; }
        public string ReviewCountDisplay { get; set; }
        public string Location { get; set; }
        public string ServicesText { get; set; }
        public string ImageUrl { get; set; }
    }
}
