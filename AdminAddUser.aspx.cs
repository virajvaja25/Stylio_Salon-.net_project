using System;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminAddUser : Page
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
                    lblAdminName.Text = Session["AdminName"].ToString();
                }
            }
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string phone = txtPhoneNumber.Text.Trim();
            string email = txtEmailAddress.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPwd = txtConfirmPassword.Text.Trim();
            string status = ddlStatus.SelectedValue;

            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(email))
            {
                lblMessage.Text = "Please enter both Full Name and Email Address.";
                lblMessage.CssClass = "admin-msg-error";
                lblMessage.Visible = true;
                return;
            }

            if (!string.IsNullOrEmpty(password) && !string.Equals(password, confirmPwd, StringComparison.Ordinal))
            {
                lblMessage.Text = "Passwords do not match.";
                lblMessage.CssClass = "admin-msg-error";
                lblMessage.Visible = true;
                return;
            }

            lblMessage.Text = "User '" + Server.HtmlEncode(fullName) + "' added successfully!";
            lblMessage.CssClass = "admin-msg-success";
            lblMessage.Visible = true;

            // Clear inputs
            txtFullName.Text = "";
            txtPhoneNumber.Text = "";
            txtEmailAddress.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            ddlStatus.SelectedIndex = 0;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }

        protected void btnNavLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("IsAdminLoggedIn");
            Session.Remove("AdminName");
            Session.Remove("AdminEmail");
            Response.Redirect("AdminLogin.aspx?logout=1");
        }
    }
}
