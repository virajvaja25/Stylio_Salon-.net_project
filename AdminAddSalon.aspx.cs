using System;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminAddSalon : Page
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
                    lblAdminName.Text = Session["AdminName"].ToString();
                }
            }
        }

        protected void btnAddSalon_Click(object sender, EventArgs e)
        {
            string owner = txtOwnerName.Text.Trim();
            string phone = txtPhoneNumber.Text.Trim();
            string email = txtEmailAddress.Text.Trim();
            string details = txtSalonDetails.Text.Trim();
            string location = txtSalonLocation.Text.Trim();
            string hours = ddlOpeningHours.SelectedValue;
            string status = ddlStatus.SelectedValue;

            if (string.IsNullOrEmpty(owner) || string.IsNullOrEmpty(location))
            {
                lblMessage.Text = "Please enter Owner Name and Salon Location.";
                lblMessage.CssClass = "admin-msg-error";
                lblMessage.Visible = true;
                return;
            }

            lblMessage.Text = "Salon by '" + Server.HtmlEncode(owner) + "' added successfully!";
            lblMessage.CssClass = "admin-msg-success";
            lblMessage.Visible = true;

            // Clear inputs
            txtOwnerName.Text = "";
            txtPhoneNumber.Text = "";
            txtEmailAddress.Text = "";
            txtSalonDetails.Text = "";
            txtSalonLocation.Text = "";
            ddlOpeningHours.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }

        protected void btnNavLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("IsAdminLoggedIn");
            Session.Remove("AdminName");
            Session.Remove("AdminEmail");
            Response.Redirect("AdminLogin.aspx?logout=1");
        }
    }
}
