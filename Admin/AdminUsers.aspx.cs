using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminUsers : Page
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
                if (Session["AdminName"] != null)
                {
                    string name = Session["AdminName"].ToString();
                    if (!string.IsNullOrEmpty(name))
                    {
                        lblAdminName.Text = name;
                    }
                }

                BindUsers();
            }
        }

        private void BindUsers()
        {
            string search = txtSearchUsers.Text.Trim();

            DataTable dt;
            if (!string.IsNullOrEmpty(search))
            {
                dt = Db.SearchUsers(search);
            }
            else
            {
                dt = Db.GetAllUsers();
            }

            // Add display columns
            dt.Columns.Add("AvatarUrl", typeof(string));
            dt.Columns.Add("StatusCssClass", typeof(string));
            dt.Columns.Add("Status", typeof(string));

            string[] avatars = new[] { "~/Images/admin_icons/avatar_coral.svg", "~/Images/admin_icons/avatar_teal.svg" };
            int i = 0;
            foreach (DataRow row in dt.Rows)
            {
                row["AvatarUrl"] = avatars[i % 2];
                row["Status"] = "Active";
                row["StatusCssClass"] = "admin-user-badge-active";
                i++;
            }

            if (dt.Rows.Count == 0)
            {
                rptUsers.Visible = false;
                pnlNoUsers.Visible = true;
            }
            else
            {
                rptUsers.Visible = true;
                pnlNoUsers.Visible = false;
                rptUsers.DataSource = dt;
                rptUsers.DataBind();
            }

            int total = Db.GetTotalUsers();
            lblPaginationInfo.Text = string.Format("Showing 1 to {0} of {1} users", dt.Rows.Count, total);
        }

        protected void txtSearchUsers_TextChanged(object sender, EventArgs e)
        {
            BindUsers();
        }

        protected void rptUsers_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteUser")
            {
                int userId;
                if (int.TryParse(e.CommandArgument.ToString(), out userId))
                {
                    Db.DeleteUser(userId);
                    BindUsers();
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
