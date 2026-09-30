using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Stylio_Salon
{
    public partial class Services : System.Web.UI.Page
    {
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
                BindCatalog();
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

        private void BindCatalog()
        {
            var catalog = new List<ServiceCatalogItem>
            {
                new ServiceCatalogItem
                {
                    Name = "Classic Haircut & Styling",
                    Category = "Hair",
                    Description = "Precision cut customized to your face structure, topped off with a refreshing wash and blow-dry style.",
                    Duration = "30-45 mins",
                    PriceRange = "\u20B9250 - \u20B9500",
                    IconUrl = "~/Images/DefaultScreen/icon-haircut.png"
                },
                new ServiceCatalogItem
                {
                    Name = "Beard Trim & Precision Shape",
                    Category = "Beard",
                    Description = "Expert beard shaping, razor lining, hot towel wrap, and nourishing beard oil finish.",
                    Duration = "20-30 mins",
                    PriceRange = "\u20B9150 - \u20B9300",
                    IconUrl = "~/Images/DefaultScreen/icon-beard.png"
                },
                new ServiceCatalogItem
                {
                    Name = "Global Hair Color & Streaks",
                    Category = "Color",
                    Description = "Ammonia-free vibrant hair coloring and highlights tailored to your skin tone and preference.",
                    Duration = "60-90 mins",
                    PriceRange = "\u20B9800 - \u20B92000",
                    IconUrl = "~/Images/DefaultScreen/icon-haircolor.png"
                },
                new ServiceCatalogItem
                {
                    Name = "Deep Cleansing Facial",
                    Category = "Skin",
                    Description = "Exfoliating scrub, steam, blackhead removal, skin massage, and rejuvenating herbal face pack.",
                    Duration = "45-60 mins",
                    PriceRange = "\u20B9500 - \u20B91200",
                    IconUrl = "~/Images/DefaultScreen/icon-facial.png"
                },
                new ServiceCatalogItem
                {
                    Name = "Intense Hair Spa & Repair",
                    Category = "Hair",
                    Description = "Deep conditioning mask, scalp massage, and steam therapy to combat dryness and hair fall.",
                    Duration = "45 mins",
                    PriceRange = "\u20B9600 - \u20B91500",
                    IconUrl = "~/Images/DefaultScreen/icon-haircut.png"
                },
                new ServiceCatalogItem
                {
                    Name = "D-Tan & Skin Brightening",
                    Category = "Skin",
                    Description = "Instant glow therapy to remove tan caused by UV exposure, revealing hydrated glowing skin.",
                    Duration = "30 mins",
                    PriceRange = "\u20B9400 - \u20B9900",
                    IconUrl = "~/Images/DefaultScreen/icon-facial.png"
                }
            };

            rptCatalog.DataSource = catalog;
            rptCatalog.DataBind();
        }

        protected void rptCatalog_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "BookService")
            {
                string serviceName = e.CommandArgument.ToString();
                Response.Redirect("BookAppointment.aspx?service=" + Server.UrlEncode(serviceName));
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
