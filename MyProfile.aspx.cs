using System;

namespace Stylio_Salon
{
    public partial class MyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirect to login if not authenticated
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Pre-fill form from session
                lblUserName.Text   = Session["UserName"] as string ?? "User";
                txtFullName.Text   = Session["UserFullName"] as string ?? "";
                txtEmail.Text      = Session["UserEmail"]    as string
                                     ?? Session["UserName"]  as string ?? "";
                txtMobile.Text     = Session["UserMobile"]   as string ?? "";
            }
        }

        // ---------------- User Dropdown Toggle ----------------
        protected void lnkUserToggle_Click(object sender, EventArgs e)
        {
            pnlUserDropdown.Visible = !pnlUserDropdown.Visible;
        }

        // ---------------- Save Profile ----------------
        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            // Persist back to session (replace with DB call in production)
            Session["UserFullName"] = txtFullName.Text.Trim();
            Session["UserEmail"]    = txtEmail.Text.Trim();
            Session["UserMobile"]   = txtMobile.Text.Trim();

            // Update display name if email changed
            if (!string.IsNullOrEmpty(txtEmail.Text.Trim()))
                Session["UserName"] = txtEmail.Text.Trim();

            lblUserName.Text = Session["UserName"] as string ?? "User";
            pnlSuccess.Visible = true;
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
    }
}
