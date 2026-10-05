using System;

namespace Stylio_Salon
{
    public partial class Settings : System.Web.UI.Page
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
                lblUserName.Text = Session["UserName"] as string ?? "User";

                // Restore saved notification preference from session if present
                if (Session["EmailNotifications"] != null)
                    chkEmailNotifications.Checked = (bool)Session["EmailNotifications"];
            }
        }

        // ---------------- User Dropdown Toggle ----------------
        protected void lnkUserToggle_Click(object sender, EventArgs e)
        {
            pnlUserDropdown.Visible = !pnlUserDropdown.Visible;
        }

        // ---------------- Save Settings ----------------
        protected void btnSaveSettings_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string currentPwd = txtCurrentPassword.Text;
            string newPwd     = txtNewPassword.Text;

            // Only change password if fields are filled
            if (!string.IsNullOrEmpty(newPwd))
            {
                // TODO: validate currentPwd against DB and update new password
                // Placeholder: accept any non-empty current password
                if (string.IsNullOrEmpty(currentPwd))
                {
                    pnlSuccess.Visible = false;
                    lblSuccess.Text = "Please enter your current password to change it.";
                    lblSuccess.Style["color"] = "#B3261E";
                    pnlSuccess.Visible = true;
                    return;
                }
            }

            // Save notification preference
            Session["EmailNotifications"] = chkEmailNotifications.Checked;

            // Clear password fields
            txtCurrentPassword.Text = string.Empty;
            txtNewPassword.Text     = string.Empty;
            txtConfirmPassword.Text = string.Empty;

            lblSuccess.Text = "Settings saved successfully!";
            lblSuccess.Style["color"] = "#2e7d32";
            pnlSuccess.Visible = true;
        }

        // ---------------- Logout ----------------
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("guest.aspx");
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
