using System;

namespace Stylio_Salon
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            string name, mobile;
            bool isValidUser = false;

            try
            {
                isValidUser = Db.ValidateUser(email, password, out name, out mobile);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "')</script>");
                return;
            }

            if (!isValidUser)
            {
                // Not registered, or wrong email/password
                valSummary.Visible = true;
                return;
            }

            // Admin check (email only, the user must also exist in the Users table)
            bool isAdmin = string.Equals(email, "admin@stylio.com", StringComparison.OrdinalIgnoreCase) ||
                           string.Equals(email, "viraj@stylio.com", StringComparison.OrdinalIgnoreCase) ||
                           string.Equals(email, "virajvaja@stylio.com", StringComparison.OrdinalIgnoreCase);

            Session["IsLoggedIn"] = true;
            Session["UserName"] = name;
            Session["UserFullName"] = name;
            Session["UserEmail"] = email;
            Session["UserMobile"] = mobile;

            if (isAdmin)
            {
                Session["IsAdminLoggedIn"] = true;
                Session["AdminEmail"] = email;
                Session["AdminName"] = name;
                Response.Redirect("~/Admin/AdminDashboard.aspx");
                return;
            }

            Response.Redirect("Default.aspx");
        }

        protected void lnkForgotPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx");
        }

        protected void lnkRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}