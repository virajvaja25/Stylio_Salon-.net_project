using System;

namespace Stylio_Salon
{
    public partial class AboutUs : System.Web.UI.Page
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
                // Hide login/register buttons for logged-in users
                btnLogin.Visible    = false;
                btnRegister.Visible = false;
            }
        }

        // ---------------- Navigation ----------------
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

        // ---------------- Guest Buttons ----------------
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        // ---------------- Partner CTA ----------------
        protected void btnPartnerCTA_Click(object sender, EventArgs e)
        {
            Response.Redirect("Salon.aspx");
        }
    }
}
