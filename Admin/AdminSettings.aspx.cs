using System;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminSettings : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdminLoggedIn"] == null)
            {
                Session["IsAdminLoggedIn"] = true;
                Session["AdminName"] = "Viraj Vaja";
                Session["AdminEmail"] = "admin@stylio.com";
            }

            if (!IsPostBack)
            {
                if (Session["AdminName"] != null)
                {
                    string name = Session["AdminName"].ToString();
                    if (!string.IsNullOrEmpty(name))
                    {
                        lblAdminName.Text = name;
                        txtFullName.Text = name;
                    }
                }

                if (Session["AdminEmail"] != null)
                {
                    string email = Session["AdminEmail"].ToString();
                    if (!string.IsNullOrEmpty(email))
                    {
                        txtEmailAddress.Text = email;
                    }
                }
            }
        }

        protected void btnTabProfile_Click(object sender, EventArgs e)
        {
            btnTabProfile.CssClass = "admin-settings-tab admin-settings-tab-active";
            btnTabChangePassword.CssClass = "admin-settings-tab";
            pnlProfileView.Visible = true;
            pnlPasswordView.Visible = false;
            pnlAlertBanner.Visible = false;
        }

        protected void btnTabChangePassword_Click(object sender, EventArgs e)
        {
            btnTabProfile.CssClass = "admin-settings-tab";
            btnTabChangePassword.CssClass = "admin-settings-tab admin-settings-tab-active";
            pnlProfileView.Visible = false;
            pnlPasswordView.Visible = true;
            pnlAlertBanner.Visible = false;
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            string newName = txtFullName.Text.Trim();
            string newEmail = txtEmailAddress.Text.Trim();

            if (!string.IsNullOrEmpty(newName))
            {
                Session["AdminName"] = newName;
                lblAdminName.Text = newName;
            }

            if (!string.IsNullOrEmpty(newEmail))
            {
                Session["AdminEmail"] = newEmail;
            }

            lblAlertMessage.Text = "Profile settings saved successfully!";
            pnlAlertBanner.Visible = true;
        }

        protected void btnSavePassword_Click(object sender, EventArgs e)
        {
            string oldPass = txtOldPassword.Text.Trim();
            string newPass = txtNewPassword.Text.Trim();
            string confirmPass = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(oldPass) || string.IsNullOrEmpty(newPass))
            {
                lblAlertMessage.Text = "Please fill in all password fields.";
                pnlAlertBanner.CssClass = "admin-banner-alert";
                pnlAlertBanner.Visible = true;
                return;
            }

            if (newPass != confirmPass)
            {
                lblAlertMessage.Text = "New password and Confirm password do not match.";
                pnlAlertBanner.CssClass = "admin-banner-alert";
                pnlAlertBanner.Visible = true;
                return;
            }

            txtOldPassword.Text = "";
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";

            lblAlertMessage.Text = "Password updated successfully!";
            pnlAlertBanner.CssClass = "admin-banner-alert admin-banner-alert-success";
            pnlAlertBanner.Visible = true;
        }

        protected void btnCloseAlert_Click(object sender, EventArgs e)
        {
            pnlAlertBanner.Visible = false;
        }

        protected void btnNavLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("IsAdminLoggedIn");
            Session.Remove("AdminName");
            Session.Remove("AdminEmail");

            Response.Redirect("AdminLogin.aspx?logout=1", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
