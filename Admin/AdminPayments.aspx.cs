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
            // Load total revenue and users from database
            decimal totalRevenue = Db.GetTotalRevenue();
            int totalUsers = Db.GetTotalUsers();

            lblTotalValue.Text = "\u20B9" + totalRevenue.ToString("N0");
            lblTodayValue.Text = "\u20B9" + totalRevenue.ToString("N0");
            lblNewUsersValue.Text = totalUsers.ToString("N0");
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
