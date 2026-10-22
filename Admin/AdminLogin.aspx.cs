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

                // If already logged in as admin, skip login page
                if (Session["IsAdminLoggedIn"] != null && (bool)Session["IsAdminLoggedIn"])
                {
                    Response.Redirect("AdminDashboard.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

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

            // Validate admin credentials from DB
            if (Db.ValidateAdmin(emailOrId, password))
            {
                string adminName = Db.GetAdminName(emailOrId);
                Session["IsAdminLoggedIn"] = true;
                Session["AdminEmail"] = emailOrId;
                Session["AdminName"] = !string.IsNullOrEmpty(adminName) ? adminName : "Admin";

                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                lblErrorMessage.Text = "Invalid Admin ID or Password. Please try again.";
                lblErrorMessage.Visible = true;
            }
        }
    }
}
