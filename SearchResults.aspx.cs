using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Stylio_Salon
{
    public partial class SearchResults : System.Web.UI.Page
    {
        private static readonly List<SalonListItem> Salons = new List<SalonListItem>
        {
            new SalonListItem
            {
                Id = 1,
                Name = "Stylio Men's Salon",
                Rating = 4.9,
                Location = "Trikon Bag, Rajkot",
                ServicesText = "Hair Cut, Beard, Facial",
                ImageUrl = "~/Images/SalonScreen/salon1.png"
            },
            new SalonListItem
            {
                Id = 2,
                Name = "The Mae Mane Salon",
                Rating = 4.8,
                Location = "Bhaktinagar Circle, Rajkot",
                ServicesText = "Hair Cut, Beard, Hair Color",
                ImageUrl = "~/Images/SalonScreen/salon2.png"
            },
            new SalonListItem
            {
                Id = 3,
                Name = "The Hair Studio",
                Rating = 4.7,
                Location = "Surat, Gujrat",
                ServicesText = "Hair Cut, Beard, Hair Spa",
                ImageUrl = "~/Images/SalonScreen/salon3.png"
            }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                CheckAuth();
                PerformSearch();
            }
        }

        private void CheckAuth()
        {
            bool isLoggedIn = Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"];
            if (isLoggedIn)
            {
                btnLogin.Visible = false;
                btnRegister.Text = "Logout (" + (Session["UserName"] as string ?? "User") + ")";
                btnRegister.CssClass = "btn-nav-login";
                btnRegister.Click -= btnRegister_Click;
                btnRegister.Click += (s, ev) =>
                {
                    Session.Clear();
                    Session.Abandon();
                    Response.Redirect("guest.aspx");
                };
            }
        }

        private void PerformSearch()
        {
            string location = Request.QueryString["location"] ?? string.Empty;
            string service = Request.QueryString["service"] ?? string.Empty;
            string date = Request.QueryString["date"] ?? string.Empty;

            lblLocationBadge.Text = string.IsNullOrEmpty(location) ? "Location: All Locations" : "Location: " + location;
            lblServiceBadge.Text = string.IsNullOrEmpty(service) ? "Service: All Services" : "Service: " + service;
            lblDateBadge.Text = string.IsNullOrEmpty(date) ? "Date: Flexible" : "Date: " + date;

            IEnumerable<SalonListItem> results = Salons;

            if (!string.IsNullOrEmpty(location))
            {
                results = results.Where(s =>
                    s.Location.IndexOf(location, StringComparison.OrdinalIgnoreCase) >= 0
                    || (location.Equals("trikonbag", StringComparison.OrdinalIgnoreCase) && s.Location.IndexOf("Trikon", StringComparison.OrdinalIgnoreCase) >= 0)
                    || (location.Equals("bhaktinagar", StringComparison.OrdinalIgnoreCase) && s.Location.IndexOf("Bhakti", StringComparison.OrdinalIgnoreCase) >= 0)
                    || (location.Equals("gondalchowkdi", StringComparison.OrdinalIgnoreCase) && s.Location.IndexOf("Gondal", StringComparison.OrdinalIgnoreCase) >= 0));
            }

            if (!string.IsNullOrEmpty(service))
            {
                results = results.Where(s =>
                    s.ServicesText.IndexOf(service, StringComparison.OrdinalIgnoreCase) >= 0
                    || (service.Equals("haircut", StringComparison.OrdinalIgnoreCase) && s.ServicesText.IndexOf("Hair", StringComparison.OrdinalIgnoreCase) >= 0)
                    || (service.Equals("beard", StringComparison.OrdinalIgnoreCase) && s.ServicesText.IndexOf("Beard", StringComparison.OrdinalIgnoreCase) >= 0)
                    || (service.Equals("facial", StringComparison.OrdinalIgnoreCase) && s.ServicesText.IndexOf("Facial", StringComparison.OrdinalIgnoreCase) >= 0)
                    || (service.Equals("haircolor", StringComparison.OrdinalIgnoreCase) && s.ServicesText.IndexOf("Color", StringComparison.OrdinalIgnoreCase) >= 0));
            }

            var list = results.ToList();
            if (list.Count == 0)
            {
                pnlNoResults.Visible = true;
                rptSearchResults.Visible = false;
            }
            else
            {
                pnlNoResults.Visible = false;
                rptSearchResults.Visible = true;
                rptSearchResults.DataSource = list;
                rptSearchResults.DataBind();
            }
        }

        protected void rptSearchResults_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                string salonId = e.CommandArgument.ToString();
                Response.Redirect("SalonDetails.aspx?id=" + Server.UrlEncode(salonId));
            }
        }

        protected void lnkHome_Click(object sender, EventArgs e)
        {
            bool isLoggedIn = Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"];
            Response.Redirect(isLoggedIn ? "Default.aspx" : "guest.aspx");
        }

        protected void lnkSalon_Click(object sender, EventArgs e)
        {
            Response.Redirect("Salon.aspx");
        }

        protected void lnkServices_Click(object sender, EventArgs e)
        {
            Response.Redirect("Services.aspx");
        }

        protected void lnkReviews_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reviews.aspx");
        }

        protected void lnkAboutUs_Click(object sender, EventArgs e)
        {
            Response.Redirect("AboutUs.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}
