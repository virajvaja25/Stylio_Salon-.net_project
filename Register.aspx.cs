using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stylio_Salon
{

    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string mobile = txtMobile.Text.Trim();
            string password = txtPassword.Text;

            // TODO: replace with real user-creation logic (EF / database / API call)
            bool created = CreateUser(fullName, email, mobile, password);

            if (created)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                valSummary.Visible = true;
            }
        }

        private bool CreateUser(string fullName, string email, string mobile, string password)
        {
            // Placeholder for actual account-creation logic.
            return true;
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}