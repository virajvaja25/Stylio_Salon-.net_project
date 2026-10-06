using System;
using System.Collections.Generic;
using System.Linq;

namespace Stylio_Salon
{
    public partial class Salons : System.Web.UI.Page
    {
        private static readonly List<SalonListItem> AllSalons = new List<SalonListItem>
        {
            new SalonListItem
            {
                Id = 1,
                Name = "Stylio Men's Salon",
                Rating = 4.9,
                Location = "Trikon Bag, Rajkot",
                ServicesText = "Hair Cut, Beard, Facial",
                ImageUrl = "~/Images/salon_stylio_v2.png"
            },
            new SalonListItem
            {
                Id = 2,
                Name = "The Mae Mane Salon",
                Rating = 4.8,
                Location = "Bhaktinagar Circle, Rajkot",
                ServicesText = "Hair Cut, Beard, Hair Color",
                ImageUrl = "~/Images/salon_maemane_v2.png"
            },
            new SalonListItem
            {
                Id = 3,
                Name = "The Hair Studio",
                Rating = 4.7,
                Location = "Surat, Gujrat",
                ServicesText = "Hair Cut, Beard, Hair Spa",
                ImageUrl = "~/Images/salon_hairstudio.png"
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
                BindSalonList();
            }
        }

        private void BindSalonList(string location = null, string service = null, string minRating = null, string priceRange = null, string searchText = null)
        {
            IEnumerable<SalonListItem> filtered = AllSalons;

            if (!string.IsNullOrWhiteSpace(location))
            {
                if (location.Equals("trikonbag", StringComparison.OrdinalIgnoreCase))
                {
                    filtered = filtered.Where(s => s.Location.IndexOf("Trikon Bag", StringComparison.OrdinalIgnoreCase) >= 0);
                }
                else if (location.Equals("bhaktinagar", StringComparison.OrdinalIgnoreCase))
                {
                    filtered = filtered.Where(s => s.Location.IndexOf("Bhaktinagar", StringComparison.OrdinalIgnoreCase) >= 0);
                }
                else if (location.Equals("surat", StringComparison.OrdinalIgnoreCase))
                {
                    filtered = filtered.Where(s => s.Location.IndexOf("Surat", StringComparison.OrdinalIgnoreCase) >= 0);
                }
            }

            if (!string.IsNullOrWhiteSpace(service))
            {
                filtered = filtered.Where(s => s.ServicesText.IndexOf(service.Replace("hair", "hair "), StringComparison.OrdinalIgnoreCase) >= 0
                    || s.ServicesText.IndexOf(service, StringComparison.OrdinalIgnoreCase) >= 0);
            }

            if (!string.IsNullOrWhiteSpace(minRating) && double.TryParse(minRating, out double ratingThreshold))
            {
                filtered = filtered.Where(s => s.Rating >= ratingThreshold);
            }

            if (!string.IsNullOrWhiteSpace(searchText))
            {
                filtered = filtered.Where(s =>
                    s.Name.IndexOf(searchText, StringComparison.OrdinalIgnoreCase) >= 0
                    || s.Location.IndexOf(searchText, StringComparison.OrdinalIgnoreCase) >= 0
                    || s.ServicesText.IndexOf(searchText, StringComparison.OrdinalIgnoreCase) >= 0);
            }

            rptSalonList.DataSource = filtered.ToList();
            rptSalonList.DataBind();
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

        // ---------------- Filter Handlers ----------------
        protected void btnFilterReset_Click(object sender, EventArgs e)
        {
            ddlFilterLocation.SelectedIndex = 0;
            ddlFilterService.SelectedIndex = 0;
            ddlFilterRating.SelectedIndex = 0;
            ddlFilterPrice.SelectedIndex = 0;
            txtSearchSalon.Text = string.Empty;

            BindSalonList();
        }

        protected void btnFilterApply_Click(object sender, EventArgs e)
        {
            string location = ddlFilterLocation.SelectedValue;
            string service = ddlFilterService.SelectedValue;
            string minRating = ddlFilterRating.SelectedValue;
            string priceRange = ddlFilterPrice.SelectedValue;
            string searchText = txtSearchSalon.Text.Trim();

            BindSalonList(location, service, minRating, priceRange, searchText);
        }

        // ---------------- Salon Card Handler ----------------
        protected void rptSalonList_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                string salonId = e.CommandArgument.ToString();
                Response.Redirect("SalonDetails.aspx?id=" + Server.UrlEncode(salonId));
            }
        }
    }
}
