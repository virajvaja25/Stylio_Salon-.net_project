using System;
using System.Collections.Generic;

namespace Stylio_Salon
{
    public partial class guest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                    Name = "The Hair Studio",
                    Rating = "4.9",
                    Location = "BhaktiNagar, Rajkot",
                    ImageUrl = "~/Images/salon1.jpg"
                },
                new Salon
                {
                    Id = 2,
                    Name = "Stylio Men's Salon",
                    Rating = "4.9",
                    Location = "Trikon Bag, Rajkot",
                    ImageUrl = "~/Images/salon2.jpg"
                },
                new Salon
                {
                    Id = 3,
                    Name = "The Men Salon",
                    Rating = "4.9",
                    Location = "Gondal Chowkdi, Rajkot",
                    ImageUrl = "~/Images/salon3.jpg"
                }
            };

            rptSalons.DataSource = salons;
            rptSalons.DataBind();
        }

        private void BindServices()
        {
            var services = new List<Service>
            {
                new Service { Name = "Hair Cut", IconUrl = "~/Images/icon-haircut.png" },
                new Service { Name = "Beard", IconUrl = "~/Images/icon-beard.png" },
                new Service { Name = "Hair Color", IconUrl = "~/Images/icon-haircolor.png" },
                new Service { Name = "Facial", IconUrl = "~/Images/icon-facial.png" }
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
                    AvatarUrl = "~/Images/reviewer1.png"
                },
                new Review
                {
                    Name = "Viraj Vaja",
                    Comment = "Loved The Haircut and Service, Highly Recommended!",
                    AvatarUrl = "~/Images/reviewer2.png"
                },
                new Review
                {
                    Name = "Meet Patel",
                    Comment = "Best Salon in Town! Will visit Again.",
                    AvatarUrl = "~/Images/reviewer3.png"
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
            string location = ddlLocation.SelectedValue;
            string service = ddlService.SelectedValue;
            string date = ddlDate.SelectedValue;

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
    }
}
