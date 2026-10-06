using System;
using System.Collections.Generic;

namespace Stylio_Salon
{
    public partial class guest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Already logged in? Send them to the logged-in home instead of guest mode.
            if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Default.aspx");
                return;
            }

            if (!IsPostBack)
            {
                BindPopularSalons();
                BindServices();
                BindReviews();
            }
        }

        private void BindPopularSalons()
        {
            var salons = new List<Salon>
            {
               
                new Salon
                {
                    Id = 1,
                    Name = "Stylio Men's Salon",
                    Rating = "4.9",
                    Location = "Trikon Bag, Rajkot",
                    ImageUrl = "~/Images/salon_stylio_v2.png"
                },
                new Salon
                {
                    Id = 2,
                    Name = "The Mae Mane Salon",
                    Rating = "4.8",
                    Location = "Bhaktinagar Circle, Rajkot",
                    ImageUrl = "~/Images/salon_maemane_v2.png"
                },
                new Salon
                {
                    Id = 3,
                    Name = "The Hair Studio",
                    Rating = "4.7",
                    Location = "Surat, Gujrat",
                    ImageUrl = "~/Images/salon_hairstudio.png"
                }
            };

            rptSalons.DataSource = salons;
            rptSalons.DataBind();
        }

        private void BindServices()
        {
            var services = new List<Service>
            {
                new Service { Name = "Hair Cut", IconUrl = "~/Images/DefaultScreen/icon-haircut.png" },
                new Service { Name = "Beard", IconUrl = "~/Images/DefaultScreen/icon-beard.png" },
                new Service { Name = "Hair Color", IconUrl = "~/Images/DefaultScreen/icon-haircolor.png" },
                new Service { Name = "Facial", IconUrl = "~/Images/DefaultScreen/icon-facial.png" }
            };

            rptServices.DataSource = services;
            rptServices.DataBind();
        }

        private void BindReviews()
        {
            var reviews = new List<Review>
            {
                new Review
                {
                    Name = "Khush Patel",
                    Comment = "Great Experience! Very Professional Staff and Clean Environment.",
                    AvatarUrl = "~/Images/DefaultScreen/reviewer1.png"
                },
                new Review
                {
                    Name = "Viraj Vaja",
                    Comment = "Loved The Haircut and Service, Highly Recommended!",
                    AvatarUrl = "~/Images/DefaultScreen/reviewer1.png"
                },
                new Review
                {
                    Name = "Meet Patel",
                    Comment = "Best Salon in Town! Will visit Again.",
                    AvatarUrl = "~/Images/DefaultScreen/reviewer1.png"
                }
            };

            rptReviews.DataSource = reviews;
            rptReviews.DataBind();
        }

        // ---------------- Navigation Handlers ----------------
        protected void lnkHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("guest.aspx");
        }

        protected void lnkServices_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lnkSalon_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lnkReviews_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lnkAboutUs_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        // ---------------- Login / Register Handlers ----------------
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        // ---------------- Search Handler ----------------
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        // ---------------- Salon Card Handler ----------------
        protected void rptSalons_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                string salonId = e.CommandArgument != null ? e.CommandArgument.ToString() : "1";
                Response.Redirect("SalonDetails.aspx?id=" + Server.UrlEncode(salonId));
            }
        }

        // ---------------- Services / Reviews "View All" ----------------
        protected void lnkServicesViewAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lnkReviewsViewAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lnkReviewPrev_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lnkReviewNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
