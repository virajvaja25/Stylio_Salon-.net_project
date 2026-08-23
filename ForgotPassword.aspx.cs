using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stylio_Salon
{
    public partial class ForgotPassword : System.Web.UI.Page
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
            string newPassword = txtPassword.Text;

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

        private bool ResetPassword(string email, string newPassword)
        {
            // Placeholder for actual password-reset logic.
            return true;
        }
    }
}