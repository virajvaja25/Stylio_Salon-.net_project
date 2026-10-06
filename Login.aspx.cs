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
                // Synchronize login ID directly to profile name and email
                string profileName = email;
                string profileEmail = email;

                if (email.Contains("@"))
                {
                    profileEmail = email;
                    if (Session["RegisteredName"] != null &&
                        string.Equals(Session["RegisteredEmail"] as string, email, StringComparison.OrdinalIgnoreCase))
                    {
                        profileName = Session["RegisteredName"].ToString();
                    }
                    else
                    {
                        string namePart = email.Substring(0, email.IndexOf('@'));
                        profileName = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(
                            namePart.Replace(".", " ").Replace("_", " "));
                    }
                }
                else
                {
                    profileName = email;
                    profileEmail = email + "@gmail.com";
                }

                Session["IsLoggedIn"] = true;
                Session["UserName"] = profileName;
                Session["UserFullName"] = profileName;
                Session["UserEmail"] = profileEmail;
                if (Session["UserMobile"] == null)
                {
                    Session["UserMobile"] = "+91 8160689908";
                }

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
