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
            lblStatusMessage.Visible = false;
        }

        protected void btnSavePassword_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string currentPwd = txtCurrentPassword.Text.Trim();
            string newPwd = txtNewPassword.Text.Trim();
            string confirmPwd = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(currentPwd) || string.IsNullOrEmpty(newPwd) || string.IsNullOrEmpty(confirmPwd))
            {
                lblStatusMessage.Visible = true;
                lblStatusMessage.Style["color"] = "#C0392B";
                lblStatusMessage.Text = "Please fill in all password fields.";
                return;
            }

            if (newPwd.Length < 6)
            {
                lblStatusMessage.Visible = true;
                lblStatusMessage.Style["color"] = "#C0392B";
                lblStatusMessage.Text = "New password must be at least 6 characters.";
                return;
            }

            if (newPwd != confirmPwd)
            {
                lblStatusMessage.Visible = true;
                lblStatusMessage.Style["color"] = "#C0392B";
                lblStatusMessage.Text = "New password and Confirm password do not match.";
                return;
            }

            // Change password in database
            string email = Session["UserEmail"] as string;
            int userId = Db.GetUserId(email);

            if (userId > 0)
            {
                bool changed = Db.ChangePassword(userId, currentPwd, newPwd);
                if (changed)
                {
                    lblStatusMessage.Visible = true;
                    lblStatusMessage.Style["color"] = "#27AE60";
                    lblStatusMessage.Text = "Password updated successfully!";
                    pnlChangePasswordSub.Visible = false;
                    txtCurrentPassword.Text = string.Empty;
                    txtNewPassword.Text = string.Empty;
                    txtConfirmPassword.Text = string.Empty;
                }
                else
                {
                    lblStatusMessage.Visible = true;
                    lblStatusMessage.Style["color"] = "#C0392B";
                    lblStatusMessage.Text = "Current password is incorrect. Please try again.";
                }
            }
            else
            {
                lblStatusMessage.Visible = true;
                lblStatusMessage.Style["color"] = "#C0392B";
                lblStatusMessage.Text = "Unable to update password. Please log in again.";
            }
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

        // ---------------- Sidebar Handlers ----------------
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
    }
}
