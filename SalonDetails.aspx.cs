using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stylio_Salon
{
    public partial class SalonDetails : System.Web.UI.Page
    {
        private int _salonId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Login.aspx");
                return;
            }

            _salonId = GetSalonIdFromQueryString();

            if (!IsPostBack)
            {
                BindSalonDetails();
                ShowTab("About");
            }
        }
        private int GetSalonIdFromQueryString()
        {
            int id;
            return int.TryParse(Request.QueryString["id"], out id) ? id : 1;
        }

        // TODO: replace with real data lookup (database / EF / API call)
        private SalonListItem GetSalonById(int id)
        {
            var salons = new List<SalonListItem>
            {
                new SalonListItem
                {
                    Id = 1,
                    Name = "Stylio Men's Salon",
                    Rating = 4.9,
                    Location = "Trikon Bag, Rajkot",
                    ServicesText = "Beard Trim, Facial, Hair Cut",
                    ImageUrl = "~/Images/SalonScreen/salon2.png"
                },
                new SalonListItem
                {
                    Id = 2,
                    Name = "The Mae Mane Salon",
                    Rating = 4.8,
                    Location = "Bhaktinagar Circle, Rajkot",
                    ServicesText = "Hair Cut, Beard, Hair Color",
                    ImageUrl = "~/Images/SalonScreen/salon3.png"
                },
                new SalonListItem
                {
                    Id = 3,
                    Name = "The Hair Studio",
                    Rating = 4.7,
                    Location = "Surat, Gujrat",
                    ServicesText = "Hair Cut, Beard, Hair Spa",
                    ImageUrl = "~/Images/SalonScreen/salon1.png"
                }
            };

            return salons.FirstOrDefault(s => s.Id == id) ?? salons[0];
        }

        private void BindSalonDetails()
        {
            var salon = GetSalonById(_salonId);

            imgSalonHero.ImageUrl = salon.ImageUrl;
            lblSalonName.Text = salon.Name;
            lblSalonRating.Text = salon.Rating.ToString("0.0") + " (1.2K)";
            lblSalonLocation.Text = salon.Location;

            lblOpenTime.Text = "8 AM";
            lblCloseTime.Text = "9 PM";

            lblSalonDescription.Text = salon.Name + " offers professional hair, beard, and grooming services in a premium and relaxing environment.";
            lblWeekdayHours.Text = "Mon-Fri: 08:00 AM - 09:00 PM";
            lblWeekendHours.Text = "Sat-Sun: 09:00 AM - 09:00 PM";
            lblPopularServices.Text = salon.ServicesText;

            BindServicesTab(salon);
            BindReviewsTab();
        }

        private void BindServicesTab(SalonListItem salon)
        {
            var services = salon.ServicesText
                .Split(',')
                .Select(s => new Service { Name = s.Trim() })
                .ToList();

            rptSalonServices.DataSource = services;
            rptSalonServices.DataBind();
        }

        private void BindReviewsTab()
        {
            var reviews = new List<Review>
            {
                new Review { Name = "Khush Patel", Comment = "Great Experience! Very Professional Staff and Clean Environment." },
                new Review { Name = "Viraj Vaja", Comment = "Loved The Haircut and Service, Highly Recommended!" },
                new Review { Name = "Meet Patel", Comment = "Best Salon in Town! Will visit Again." }
            };

            rptSalonReviews.DataSource = reviews;
            rptSalonReviews.DataBind();
        }

        // ---------------- Tab Handlers ----------------
        private void ShowTab(string tabName)
        {
            pnlAboutTab.Visible = tabName == "About";
            pnlServicesTab.Visible = tabName == "Services";
            pnlReviewsTab.Visible = tabName == "Reviews";

            lnkTabAbout.CssClass = tabName == "About" ? "salon-tab salon-tab-active" : "salon-tab";
            lnkTabServices.CssClass = tabName == "Services" ? "salon-tab salon-tab-active" : "salon-tab";
            lnkTabReviews.CssClass = tabName == "Reviews" ? "salon-tab salon-tab-active" : "salon-tab";
        }

        protected void lnkTabAbout_Click(object sender, EventArgs e)
        {
            ShowTab("About");
        }

        protected void lnkTabServices_Click(object sender, EventArgs e)
        {
            ShowTab("Services");
        }

        protected void lnkTabReviews_Click(object sender, EventArgs e)
        {
            ShowTab("Reviews");
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

        // ---------------- Book Appointment ----------------
        protected void btnBookAppointment_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookAppointment.aspx?salonId=" + Server.UrlEncode(_salonId.ToString()));
        }
    }
}