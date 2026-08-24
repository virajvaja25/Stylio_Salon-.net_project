using System;
using System.Collections.Generic;

namespace Stylio_Salon
{
    public partial class Salons : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSalonList();
            }
        }

        private void BindSalonList()
        {
            var salons = new List<SalonListItem>
            {
                new SalonListItem
                {
                    Id = 1,
                    Name = "Stylio Men's Salon",
                    Rating = 4.9,
                    ReviewCountDisplay = "(1.2K)",
                    Location = "Trikon Bag, Rajkot",
                    ServicesText = "Hair Cut, Beard, Facial",
                    ImageUrl = "~/Images/Salons/salon1.jpg"
                },
                new SalonListItem
                {
                    Id = 2,
                    Name = "The Mae Mane Salon",
                    Rating = 4.8,
                    ReviewCountDisplay = "(1K)",
                    Location = "Bhaktinagar Circle, Rajkot",
                    ServicesText = "Hair Cut, Beard, Hair Color",
                    ImageUrl = "~/Images/Salons/salon2.jpg"
                },
                new SalonListItem
                {
                    Id = 3,
                    Name = "The Hair Studio",
                    Rating = 4.7,
                    ReviewCountDisplay = "(985)",
                    Location = "Surat, Gujrat",
                    ServicesText = "Hair Cut, Beard, Hair Spa",
                    ImageUrl = "~/Images/Salons/salon3.jpg"
                }
            };

            rptSalonList.DataSource = salons;
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
            Response.Redirect("Salons.aspx");
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

            // TODO: replace with real filtering logic (database query / LINQ filter)
            BindSalonList();
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
