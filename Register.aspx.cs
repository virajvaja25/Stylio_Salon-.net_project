using System;
using System.Data.SqlClient;

namespace Stylio_Salon
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Server-side ASP.NET validators check
            if (!Page.IsValid)
            {
                return;
            }

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string mobile = txtMobile.Text.Trim();
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            // Pure C# server-side validation checks
            if (string.IsNullOrEmpty(fullName))
            {
                Response.Write("<script>alert('Full Name is required.');</script>");
                return;
            }

            if (string.IsNullOrEmpty(email) || !email.Contains("@") || !email.Contains("."))
            {
                Response.Write("<script>alert('Please enter a valid email address.');</script>");
                return;
            }

            if (string.IsNullOrEmpty(mobile) || mobile.Length < 10)
            {
                Response.Write("<script>alert('Please enter a valid 10-digit mobile number.');</script>");
                return;
            }

            if (string.IsNullOrEmpty(password) || password.Length < 6)
            {
                Response.Write("<script>alert('Password must be at least 6 characters long.');</script>");
                return;
            }

            if (password != confirmPassword)
            {
                Response.Write("<script>alert('Passwords do not match.');</script>");
                return;
            }

            if (Db.EmailExists(email))
            {
                Response.Write("<script>alert('This email is already registered.');</script>");
                return;
            }

            bool created = CreateUser(fullName, email, mobile, password);

            if (created)
            {
                Session["RegisteredName"] = fullName;
                Session["RegisteredEmail"] = email;
                Session["RegisteredMobile"] = mobile;
                Session["UserName"] = fullName;
                Session["UserFullName"] = fullName;
                Session["UserEmail"] = email;
                Session["UserMobile"] = mobile;

                Response.Write("<script>alert('Registration Successful! Please login.'); window.location='Login.aspx';</script>");
            }
        }

        private bool CreateUser(string fullName, string email, string mobile, string password)
        {
            try
            {
                return Db.RegisterUser(fullName, email, mobile, password);
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627 || ex.Number == 2601)
                {
                    Response.Write("<script>alert('This email is already registered.');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Database Error: " + ex.Message.Replace("'", "") + "');</script>");
                }
                return false;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "');</script>");
                return false;
            }
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}