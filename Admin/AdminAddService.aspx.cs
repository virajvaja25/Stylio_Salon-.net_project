using System;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminAddService : Page
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
                    lblAdminName.Text = Session["AdminName"].ToString();
                }
            }
        }

        protected void btnAddService_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string serviceName = txtServiceName.Text.Trim();
            string desc = txtServiceDescription.Text.Trim();
            string category = ddlCategory.SelectedValue;
            string price = txtServicePrice.Text.Trim();
            string duration = ddlDuration.SelectedValue;
            string status = ddlStatus.SelectedValue;

            if (string.IsNullOrEmpty(serviceName))
            {
                lblMessage.Text = "Please enter Service Name.";
                lblMessage.CssClass = "admin-msg-error";
                lblMessage.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(category))
            {
                lblMessage.Text = "Please select a Category.";
                lblMessage.CssClass = "admin-msg-error";
                lblMessage.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(price))
            {
                lblMessage.Text = "Please enter Service Price.";
                lblMessage.CssClass = "admin-msg-error";
                lblMessage.Visible = true;
                return;
            }

            lblMessage.Text = "Service '" + Server.HtmlEncode(serviceName) + "' added successfully!";
            lblMessage.CssClass = "admin-msg-success";
            lblMessage.Visible = true;

            // Clear inputs
            txtServiceName.Text = "";
            txtServiceDescription.Text = "";
            ddlCategory.SelectedIndex = 0;
            txtServicePrice.Text = "";
            ddlDuration.SelectedIndex = 0;
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
