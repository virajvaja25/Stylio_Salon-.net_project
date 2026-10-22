using System;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminAddUser : Page
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
                    lblAdminName.Text = Session["AdminName"].ToString();
                }
            }
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string fullName = txtFullName.Text.Trim();
            string phone = txtPhoneNumber.Text.Trim();
            string email = txtEmailAddress.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPwd = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(email))
            {
                lblMessage.Text = "Please enter both Full Name and Email Address.";
                lblMessage.CssClass = "admin-msg-error";
                lblMessage.Visible = true;
                return;
            }

            if (!email.Contains("@") || !email.Contains("."))
            {
                lblMessage.Text = "Please enter a valid email address.";
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

            // Check if email already exists
            if (Db.EmailExists(email))
            {
                lblMessage.Text = "A user with this email address already exists.";
                lblMessage.CssClass = "admin-msg-error";
                lblMessage.Visible = true;
                return;
            }

            // Save to database
            string finalPassword = string.IsNullOrEmpty(password) ? "Stylio@123" : password;
            bool saved = Db.RegisterUser(fullName, email, phone, finalPassword);

            if (saved)
            {
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
            else
            {
                lblMessage.Text = "Failed to add user. Please try again.";
                lblMessage.CssClass = "admin-msg-error";
                lblMessage.Visible = true;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminUsers.aspx");
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
