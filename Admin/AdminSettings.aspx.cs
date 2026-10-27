using System;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminSettings : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Enforce admin login
            if (Session["IsAdminLoggedIn"] == null || !(bool)Session["IsAdminLoggedIn"])
            {
                Response.Redirect("AdminLogin.aspx");
                return;
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
                if (Request.QueryString["tab"] == "password")
                {
                    btnTabProfile.CssClass = "admin-settings-tab";
                    btnTabChangePassword.CssClass = "admin-settings-tab admin-settings-tab-active";
                    pnlProfileView.Visible = false;
                    pnlPasswordView.Visible = true;
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
            if (!Page.IsValid)
                return;

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

            // Also update in DB if admin user exists in Users table
            string currentEmail = Session["AdminEmail"] as string ?? "admin@stylio.com";
            int adminId = Db.GetUserId(currentEmail);
            if (adminId == 0)
            {
                adminId = Db.GetUserId("admin@stylio.com");
            }
            if (adminId > 0)
            {
                Db.UpdateUser(adminId, newName, "+91 98765 43210");
            }

            lblAlertMessage.Text = "Profile settings saved successfully!";
            pnlAlertBanner.CssClass = "admin-banner-alert admin-banner-alert-success";
            pnlAlertBanner.Visible = true;
        }

        protected void btnSavePassword_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string oldPass = txtCurrentPassword.Text.Trim();
            string newPass = txtNewPassword.Text.Trim();
            string confirmPass = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(oldPass) || string.IsNullOrEmpty(newPass))
            {
                lblAlertMessage.Text = "Please fill in all password fields.";
                pnlAlertBanner.CssClass = "admin-banner-alert";
                pnlAlertBanner.Visible = true;
                return;
            }

            if (newPass.Length < 6)
            {
                lblAlertMessage.Text = "New password must be at least 6 characters long.";
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

            string adminEmail = Session["AdminEmail"] as string ?? "admin@stylio.com";
            int adminId = Db.GetUserId(adminEmail);
            if (adminId == 0)
            {
                adminId = Db.GetUserId("admin@stylio.com");
            }
            if (adminId > 0)
            {
                bool updated = Db.ChangePassword(adminId, oldPass, newPass);
                if (!updated)
                {
                    lblAlertMessage.Text = "Current password does not match database record.";
                    pnlAlertBanner.CssClass = "admin-banner-alert";
                    pnlAlertBanner.Visible = true;
                    return;
                }
            }

            txtCurrentPassword.Text = "";
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
