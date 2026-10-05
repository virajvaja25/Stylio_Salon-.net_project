using System;
using System.Collections.Generic;

namespace Stylio_Salon
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Not logged in? Redirect to Login
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblUserName.Text = Session["UserName"] as string ?? "Welcome";

                BindPopularSalons();
                BindServices();
                BindReviews();
            }
        }

        // ---------------- User Dropdown Toggle ----------------
        protected void lnkUserToggle_Click(object sender, EventArgs e)
        {
            pnlUserDropdown.Visible = !pnlUserDropdown.Visible;
        }

        // ---------------- Dropdown Menu Handlers ----------------
        protected void lnkMyProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyProfile.aspx");
        }

        protected void lnkSetting_Click(object sender, EventArgs e)
        {
            Response.Redirect("Settings.aspx");
        }

        // ---------------- Navigation Handlers ----------------
        protected void lnkHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void lnkServices_Click(object sender, EventArgs e)
        {
            Response.Redirect("Services.aspx");
        }

        protected void lnkSalon_Click(object sender, EventArgs e)
        {
            Response.Redirect("Salon.aspx");
        }

        protected void lnkReviews_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reviews.aspx");
        }

        protected void lnkAboutUs_Click(object sender, EventArgs e)
        {
            Response.Redirect("AboutUs.aspx");
        }

        // ---------------- Hero / Search Handlers ----------------
        protected void btnBookAppointment_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookAppointment.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string location = ddlLocation.SelectedValue;
            string service  = ddlService.SelectedValue;
            string date     = ddlDate.SelectedValue;

            Response.Redirect(string.Format(
                "SearchResults.aspx?location={0}&service={1}&date={2}",
                Server.UrlEncode(location),
                Server.UrlEncode(service),
                Server.UrlEncode(date)));
        }

        // ---------------- Salon Card Handler ----------------
        protected void rptSalons_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                string salonId = e.CommandArgument.ToString();
                Response.Redirect("SalonDetails.aspx?id=" + Server.UrlEncode(salonId));
            }
        }

        // ---------------- Services / Reviews "View All" ----------------
        protected void lnkServicesViewAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("Services.aspx");
        }

        protected void lnkReviewsViewAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reviews.aspx");
        }

        protected void lnkReviewPrev_Click(object sender, EventArgs e)
        {
            // TODO: shift review carousel backward
        }

        protected void lnkReviewNext_Click(object sender, EventArgs e)
        {
            // TODO: shift review carousel forward
        }

        // ---------------- Data Binding ----------------
        private void BindPopularSalons()
        {
            var salons = new List<Salon>
            {
                new Salon
                {
                    Id       = 1,
                    Name     = "Stylio Men's Salon",
                    Rating   = "4.9",
                    Location = "Trikon Bag, Rajkot",
                    ImageUrl = "~/Images/DefaultScreen/salon1.png"
                },
                new Salon
                {
                    Id       = 2,
                    Name     = "The Mae Mane Salon",
                    Rating   = "4.8",
                    Location = "Bhaktinagar Circle, Rajkot",
                    ImageUrl = "~/Images/DefaultScreen/salon2.png"
                },
                new Salon
                {
                    Id       = 3,
                    Name     = "The Hair Studio",
                    Rating   = "4.7",
                    Location = "Surat, Gujrat",
                    ImageUrl = "~/Images/DefaultScreen/salon3.png"
                }
            };

            rptSalons.DataSource = salons;
            rptSalons.DataBind();
        }

        private void BindServices()
        {
            var services = new List<Service>
            {
                new Service { Name = "Hair Cut",   IconUrl = "~/Images/DefaultScreen/icon-haircut.png" },
                new Service { Name = "Beard",      IconUrl = "~/Images/DefaultScreen/icon-beard.png" },
                new Service { Name = "Hair Color", IconUrl = "~/Images/DefaultScreen/icon-haircolor.png" },
                new Service { Name = "Facial",     IconUrl = "~/Images/DefaultScreen/icon-facial.png" }
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
                    Name      = "Khush Patel",
                    Comment   = "Great Experience! Very Professional Staff and Clean Environment.",
                    AvatarUrl = "~/Images/DefaultScreen/reviewer1.png"
                },
                new Review
                {
                    Name      = "Viraj Vaja",
                    Comment   = "Loved The Haircut and Service, Highly Recommended!",
                    AvatarUrl = "~/Images/DefaultScreen/reviewer1.png"
                },
                new Review
                {
                    Name      = "Meet Patel",
                    Comment   = "Best Salon in Town! Will visit Again.",
                    AvatarUrl = "~/Images/DefaultScreen/reviewer1.png"
                }
            };

            rptReviews.DataSource = reviews;
            rptReviews.DataBind();
        }
    }
}
