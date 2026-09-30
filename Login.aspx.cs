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

            // TODO: replace with real authentication (membership provider / EF / API call)
            bool isValidUser = AuthenticateUser(email, password);

            if (isValidUser)
            {
                // Mark the session as logged in so Default.aspx / guest.aspx know which mode to show.
                Session["IsLoggedIn"] = true;
                Session["UserName"] = email;

                Response.Redirect("Default.aspx");
            }
            else
            {
                valSummary.Visible = true;
                // A generic invalid-credentials message can be shown via a Label if desired.
            }
        }

        private bool AuthenticateUser(string email, string password)
        {
            // Placeholder for actual authentication logic.
            return !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password);
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
