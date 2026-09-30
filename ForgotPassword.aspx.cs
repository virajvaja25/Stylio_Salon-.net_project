using System;

namespace Stylio_Salon
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string email = txtEmail.Text.Trim();
            string newPassword = txtNewPassword.Text;

            // TODO: replace with real password-reset logic (EF / database / API call)
            bool reset = ResetPassword(email, newPassword);

            if (reset)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                valSummary.Visible = true;
            }
        }

        protected void lnkBackToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        private bool ResetPassword(string email, string newPassword)
        {
            // Placeholder for actual password-reset logic.
            return true;
        }
    }
}
