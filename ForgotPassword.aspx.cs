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
            // Server-side ASP.NET validators check
            if (!Page.IsValid)
            {
                return;
            }

            string email = txtEmail.Text.Trim();
            string newPassword = txtNewPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            // Pure C# server-side validation checks
            if (string.IsNullOrEmpty(email))
            {
                Response.Write("<script>alert('Please enter your registered email address.');</script>");
                return;
            }

            if (!email.Contains("@") || !email.Contains("."))
            {
                Response.Write("<script>alert('Please enter a valid email address.');</script>");
                return;
            }

            if (string.IsNullOrEmpty(newPassword) || newPassword.Length < 6)
            {
                Response.Write("<script>alert('New password must be at least 6 characters long.');</script>");
                return;
            }

            if (newPassword != confirmPassword)
            {
                Response.Write("<script>alert('New Password and Confirm Password do not match.');</script>");
                return;
            }

            // Check if user exists in database
            if (!Db.EmailExists(email))
            {
                Response.Write("<script>alert('No user found with this email address.');</script>");
                return;
            }

            bool reset = ResetPassword(email, newPassword);

            if (reset)
            {
                Response.Write("<script>alert('Password reset successful! Please login with your new password.'); window.location='Login.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Failed to reset password. Please try again.');</script>");
            }
        }

        protected void lnkBackToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        private bool ResetPassword(string email, string newPassword)
        {
            return Db.ResetPasswordByEmail(email, newPassword);
        }
    }
}
