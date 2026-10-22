using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminPayments : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Enforce admin login
            if (Session["IsAdminLoggedIn"] == null || !(bool)Session["IsAdminLoggedIn"])
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                if (Session["AdminName"] != null)
                {
                    string name = Session["AdminName"].ToString();
                    if (!string.IsNullOrEmpty(name))
                    {
                        lblAdminName.Text = name;
                    }
                }

                LoadPaymentStats();
            }
        }

        private void LoadPaymentStats()
        {
            // Load total revenue from all bookings
            decimal totalRevenue = Db.GetTotalRevenue();
            int totalBookings = Db.GetTotalBookings();

            if (lblTotalRevenue != null)
                lblTotalRevenue.Text = "\u20B9" + totalRevenue.ToString("N0");
            if (lblTotalTransactions != null)
                lblTotalTransactions.Text = totalBookings.ToString("N0");
        }

        protected void btnNavLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("IsAdminLoggedIn");
            Session.Remove("AdminName");
            Session.Remove("AdminEmail");

            Response.Redirect("AdminLogin.aspx?logout=1", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
