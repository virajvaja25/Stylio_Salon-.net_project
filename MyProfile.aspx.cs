using System;

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
            // Read from Session if available, or default to the values shown in design
            string fullName = Session["UserFullName"] as string ?? Session["UserName"] as string;
            string email = Session["UserEmail"] as string ?? Session["UserName"] as string;
            string phone = Session["UserMobile"] as string;

            lblProfileName.Text = !string.IsNullOrEmpty(fullName) ? fullName : "Khush Patel";
            lblProfileEmail.Text = !string.IsNullOrEmpty(email) ? email : "Khushdobariya2682007@gmail.com";
            lblProfilePhone.Text = !string.IsNullOrEmpty(phone) ? phone : "+91 8160689908";
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
