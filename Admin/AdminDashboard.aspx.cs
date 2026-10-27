using System;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Enforce admin login — redirect if not authenticated
            if (Session["IsAdminLoggedIn"] == null || !(bool)Session["IsAdminLoggedIn"])
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Show admin name in topbar
                if (Session["AdminName"] != null)
                {
                    string name = Session["AdminName"].ToString();
                    if (!string.IsNullOrEmpty(name))
                    {
                        lblAdminName.Text = name;
                    }
                }

                // Load live stats from database
                LoadDashboardStats();
            }
        }

        private void LoadDashboardStats()
        {
            // Total Users
            int totalUsers = Db.GetTotalUsers();
            lblStatUsersValue.Text = totalUsers.ToString("N0");

            // Total Salons
            int totalSalons = Db.GetTotalSalons();
            lblStatSalonsValue.Text = totalSalons.ToString("N0");

            // Total Bookings (all-time)
            int totalBookings = Db.GetTotalBookings();
            lblStatBookingsValue.Text = totalBookings.ToString("N0");

            // Total Revenue
            decimal totalRevenue = Db.GetTotalRevenue();
            lblStatRevenueValue.Text = "\u20B9" + totalRevenue.ToString("N0");
        }

        protected void btnNavLogout_Click(object sender, EventArgs e)
        {
            // Clear session and redirect to Admin Login
            Session.Remove("IsAdminLoggedIn");
            Session.Remove("AdminName");
            Session.Remove("AdminEmail");

            Response.Redirect("AdminLogin.aspx?logout=1", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
