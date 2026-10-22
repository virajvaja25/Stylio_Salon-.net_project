using System;

namespace Stylio_Salon
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // If user is already logged in, redirect to Default.aspx
                if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Server-side ASP.NET validators check
            if (!Page.IsValid)
            {
                return;
            }

            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            // Pure C# server validation
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                Response.Write("<script>alert('Please enter both Email Address and Password.');</script>");
                return;
            }

            if (!email.Contains("@") || !email.Contains("."))
            {
                Response.Write("<script>alert('Please enter a valid email address.');</script>");
                return;
            }

            string name, mobile;
            bool isValidUser = false;

            try
            {
                isValidUser = Db.ValidateUser(email, password, out name, out mobile);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Database Error: " + ex.Message.Replace("'", "") + "');</script>");
                return;
            }

            if (!isValidUser)
            {
                Response.Write("<script>alert('Invalid email or password.');</script>");
                return;
            }

            // Admin check (email check from Users table)
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