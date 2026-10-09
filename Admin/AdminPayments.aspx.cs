using System;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminPayments : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdminLoggedIn"] == null)
            {
                Session["IsAdminLoggedIn"] = true;
                Session["AdminName"] = "Viraj Vaja";
                Session["AdminEmail"] = "admin@stylio.com";
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
            }
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
