using System;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminLogin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear any existing admin session if arriving fresh
                if (Request.QueryString["logout"] == "1")
                {
                    Session.Remove("IsAdminLoggedIn");
                    Session.Remove("AdminName");
                    Session.Remove("AdminEmail");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Validate secure credentials
            if (IsValidAdmin(email, password))
            {
                Session["IsAdminLoggedIn"] = true;
                Session["AdminEmail"] = email;
                Session["AdminName"] = "Admin Viraj Vaja";

                Response.Redirect("AdminDashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                lblErrorMessage.Text = "Invalid Admin ID or Password. Please try again.";
                lblErrorMessage.Visible = true;
            }
        }

        private bool IsValidAdmin(string email, string password)
        {
            // Secure credentials check
            if (string.Equals(password, "admin123", StringComparison.Ordinal) ||
                string.Equals(password, "stylio123", StringComparison.Ordinal))
            {
                if (string.Equals(email, "admin@stylio.com", StringComparison.OrdinalIgnoreCase) ||
                    string.Equals(email, "viraj@stylio.com", StringComparison.OrdinalIgnoreCase) ||
                    string.Equals(email, "virajvaja@stylio.com", StringComparison.OrdinalIgnoreCase) ||
                    string.Equals(email, "admin", StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }

            return false;
        }
    }
}
