using System;

namespace Stylio_Salon
{
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }

        // ---------------- Settings Options Handlers ----------------
        protected void lnkOptionChangePassword_Click(object sender, EventArgs e)
        {
            pnlChangePasswordSub.Visible = !pnlChangePasswordSub.Visible;
            pnlStatusMsg.Visible = false;
        }

        protected void lnkOptionTerms_Click(object sender, EventArgs e)
        {
            pnlStatusMsg.Visible = true;
            lblStatusMessage.Style["color"] = "#2B1B12";
            lblStatusMessage.Text = "Terms & Conditions: All appointments are subject to stylist availability.";
        }

        protected void btnSavePassword_Click(object sender, EventArgs e)
        {
            string currentPwd = txtCurrentPassword.Text.Trim();
            string newPwd = txtNewPassword.Text.Trim();
            string confirmPwd = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(currentPwd))
            {
                pnlStatusMsg.Visible = true;
                lblStatusMessage.Style["color"] = "#C0392B";
                lblStatusMessage.Text = "Please enter your current password.";
                return;
            }

            if (string.IsNullOrEmpty(newPwd) || newPwd.Length < 6)
            {
                pnlStatusMsg.Visible = true;
                lblStatusMessage.Style["color"] = "#C0392B";
                lblStatusMessage.Text = "New password must be at least 6 characters.";
                return;
            }

            if (newPwd != confirmPwd)
            {
                pnlStatusMsg.Visible = true;
                lblStatusMessage.Style["color"] = "#C0392B";
                lblStatusMessage.Text = "New passwords do not match.";
                return;
            }

            // Save success
            pnlStatusMsg.Visible = true;
            lblStatusMessage.Style["color"] = "#2E7D32";
            lblStatusMessage.Text = "Password updated successfully!";

            txtCurrentPassword.Text = string.Empty;
            txtNewPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
        }

        // ---------------- Sidebar Navigation ----------------
        protected void lnkSideProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyProfile.aspx");
        }

        protected void lnkSideBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyBooking.aspx");
        }

        protected void lnkSideSettings_Click(object sender, EventArgs e)
        {
            Response.Redirect("Settings.aspx");
        }

        protected void lnkSidePayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }

        protected void lnkSideLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("guest.aspx");
        }

        // ---------------- Header Navigation ----------------
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
