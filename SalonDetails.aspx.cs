using System;
using System.Collections.Generic;
using System.Data;
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

        private void BindSalonDetails()
        {
            // Load from database
            DataRow salon = Db.GetSalonById(_salonId);

            if (salon != null)
            {
                string salonName = salon["SalonName"].ToString();
                string address = salon["Address"].ToString();
                string desc = salon["SalonDescription"].ToString();
                string imgFile = salon["SalonImage"].ToString();
                string openingHour = salon["OpeningHour"].ToString();

                imgSalonHero.ImageUrl = !string.IsNullOrEmpty(imgFile)
                    ? "~/Images/" + imgFile
                    : "~/Images/salon_stylio_v2.png";

                lblSalonName.Text = salonName;
                lblSalonRating.Text = "4.8 (1.2K)";
                lblSalonLocation.Text = address;

                lblOpenTime.Text = "8 AM";
                lblCloseTime.Text = "9 PM";

                lblSalonDescription.Text = !string.IsNullOrEmpty(desc)
                    ? desc
                    : salonName + " offers professional hair, beard, and grooming services in a premium and relaxing environment.";

                lblWeekdayHours.Text = !string.IsNullOrEmpty(openingHour) ? openingHour : "Mon-Fri: 08:00 AM - 09:00 PM";
                lblWeekendHours.Text = "Sat-Sun: 09:00 AM - 09:00 PM";

                // Use description as services if no separate services column
                string services = !string.IsNullOrEmpty(desc) ? desc : "Hair Cut, Beard, Facial";
                lblPopularServices.Text = services;

                BindServicesTab(services);
            }
            else
            {
                // Fallback: load first salon
                DataTable dt = Db.GetAllSalons();
                if (dt.Rows.Count > 0)
                {
                    DataRow r = dt.Rows[0];
                    lblSalonName.Text = r["SalonName"].ToString();
                    lblSalonRating.Text = "4.8 (1.2K)";
                    lblSalonLocation.Text = r["Address"].ToString();
                    lblOpenTime.Text = "8 AM";
                    lblCloseTime.Text = "9 PM";
                    lblSalonDescription.Text = r["SalonDescription"].ToString();
                    lblWeekdayHours.Text = "Mon-Fri: 08:00 AM - 09:00 PM";
                    lblWeekendHours.Text = "Sat-Sun: 09:00 AM - 09:00 PM";
                    string svcs = !string.IsNullOrEmpty(r["SalonDescription"].ToString()) ? r["SalonDescription"].ToString() : "Hair Cut, Beard, Facial";
                    lblPopularServices.Text = svcs;
                    BindServicesTab(svcs);
                }
            }

            BindReviewsTab();
        }

        private void BindServicesTab(string servicesText)
        {
            var services = servicesText
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
            bool isLoggedIn = Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"];
            Response.Redirect(isLoggedIn ? "Default.aspx" : "guest.aspx");
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
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Login.aspx");
                return;
            }
            Response.Redirect("BookAppointment.aspx?salonId=" + Server.UrlEncode(_salonId.ToString()));
        }
    }
}