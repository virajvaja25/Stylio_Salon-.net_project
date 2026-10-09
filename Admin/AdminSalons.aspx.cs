using System;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminSalons : Page
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

        protected void txtSearchSalons_TextChanged(object sender, EventArgs e)
        {
            string keyword = txtSearchSalons.Text.Trim().ToLower();
            if (string.IsNullOrEmpty(keyword))
            {
                pnlSalonItem1.Visible = true;
                pnlSalonItem2.Visible = true;
                pnlSalonItem3.Visible = true;
                return;
            }

            pnlSalonItem1.Visible = lblSalonTitle1.Text.ToLower().Contains(keyword) || lblSalonAddress1.Text.ToLower().Contains(keyword) || lblSalonServices1.Text.ToLower().Contains(keyword);
            pnlSalonItem2.Visible = lblSalonTitle2.Text.ToLower().Contains(keyword) || lblSalonAddress2.Text.ToLower().Contains(keyword) || lblSalonServices2.Text.ToLower().Contains(keyword);
            pnlSalonItem3.Visible = lblSalonTitle3.Text.ToLower().Contains(keyword) || lblSalonAddress3.Text.ToLower().Contains(keyword) || lblSalonServices3.Text.ToLower().Contains(keyword);
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
