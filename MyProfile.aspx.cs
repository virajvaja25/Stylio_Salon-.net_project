using System;
using System.Data;

namespace Stylio_Salon
{
    public partial class MyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUserProfile();
            }
        }

        private void LoadUserProfile()
        {
            string email = Session["UserEmail"] as string;

            if (!string.IsNullOrEmpty(email))
            {
                // Load from database
                DataRow user = Db.GetUserByEmail(email);
                if (user != null)
                {
                    string name = user["Name"].ToString();
                    string mobile = user["MobileNumber"].ToString();

                    lblProfileName.Text = !string.IsNullOrEmpty(name) ? name : email;
                    lblProfileEmail.Text = email;
                    lblProfilePhone.Text = !string.IsNullOrEmpty(mobile) ? mobile : "Not provided";

                    // Update session with fresh data
                    Session["UserFullName"] = name;
                    Session["UserMobile"] = mobile;
                    return;
                }
            }

            // Fallback to session values
            string sessionName = Session["UserFullName"] as string ?? Session["UserName"] as string;
            string sessionPhone = Session["UserMobile"] as string;
            lblProfileName.Text = !string.IsNullOrEmpty(sessionName) ? sessionName : "User";
            lblProfileEmail.Text = !string.IsNullOrEmpty(email) ? email : "Not available";
            lblProfilePhone.Text = !string.IsNullOrEmpty(sessionPhone) ? sessionPhone : "Not provided";
        }

        // ---------------- Sidebar Navigation ----------------
        protected void lnkSideProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyProfile.aspx");
        }

        protected void lnkSideBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyBooking.aspx");
        }

        protected void lnkSideSettings_Click(object sender, EventArgs e)
        {
            Response.Redirect("Settings.aspx");
        }

        protected void lnkSidePayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }

        protected void lnkSideLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("guest.aspx");
        }

        // ---------------- Header Navigation ----------------
        protected void lnkHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void lnkServices_Click(object sender, EventArgs e)
        {
            Response.Redirect("Services.aspx");
        }

        protected void lnkSalon_Click(object sender, EventArgs e)
        {
            Response.Redirect("Salon.aspx");
        }

        protected void lnkReviews_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reviews.aspx");
        }

        protected void lnkAboutUs_Click(object sender, EventArgs e)
        {
            Response.Redirect("AboutUs.aspx");
        }
    }
}
