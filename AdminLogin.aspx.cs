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
            string emailOrId = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(emailOrId))
            {
                lblErrorMessage.Text = "Please enter your Email Address or Admin ID.";
                lblErrorMessage.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(password))
            {
                lblErrorMessage.Text = "Please enter your Password.";
                lblErrorMessage.Visible = true;
                return;
            }

            if (IsValidAdmin(emailOrId, password))  
            {
                Session["IsAdminLoggedIn"] = true;
                Session["AdminEmail"] = emailOrId;
                Session["AdminName"] = "Viraj Vaja";

                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                lblErrorMessage.Text = "Invalid Admin ID or Password. (Email: admin@stylio.com | Password: admin123)";
                lblErrorMessage.Visible = true;
            }
        }

        private bool IsValidAdmin(string id, string pwd)
        {
            // Case-insensitive password check: admin123, admin, stylio123, 123456
            if (string.Equals(pwd, "admin123", StringComparison.OrdinalIgnoreCase) ||
                string.Equals(pwd, "admin", StringComparison.OrdinalIgnoreCase) ||
                string.Equals(pwd, "stylio123", StringComparison.OrdinalIgnoreCase) ||
                string.Equals(pwd, "123456", StringComparison.OrdinalIgnoreCase))
            {
                return true;
            }

            return false;
        }
    }
}
