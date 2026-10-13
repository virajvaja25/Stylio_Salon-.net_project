using System;
using System.Data.SqlClient;

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

                Response.Write("<script>alert('Registered')</script>");
                Response.Redirect("Login.aspx");
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
                    Response.Write("<script>alert('This email is already registered')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "')</script>");
                }
                return false;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "')</script>");
                return false;
            }
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}