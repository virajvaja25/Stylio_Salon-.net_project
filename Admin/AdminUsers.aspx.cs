using System;
using System.Collections.Generic;
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

            // Ensure all required display columns exist in DataTable
            if (!dt.Columns.Contains("FullName"))
                dt.Columns.Add("FullName", typeof(string));
            if (!dt.Columns.Contains("Phone"))
                dt.Columns.Add("Phone", typeof(string));
            if (!dt.Columns.Contains("JoinedOn"))
                dt.Columns.Add("JoinedOn", typeof(string));
            if (!dt.Columns.Contains("AvatarUrl"))
                dt.Columns.Add("AvatarUrl", typeof(string));
            if (!dt.Columns.Contains("StatusCssClass"))
                dt.Columns.Add("StatusCssClass", typeof(string));
            if (!dt.Columns.Contains("Status"))
                dt.Columns.Add("Status", typeof(string));

            string[] avatars = new[] { "~/Images/admin_icons/avatar_coral.svg", "~/Images/admin_icons/avatar_teal.svg" };
            var userList = new List<UserRecord>();
            int i = 0;

            foreach (DataRow row in dt.Rows)
            {
                string rawName = row["Name"] != DBNull.Value ? row["Name"].ToString() : "";
                string rawPhone = row["MobileNumber"] != DBNull.Value ? row["MobileNumber"].ToString() : "";
                string rawEmail = row["Email"] != DBNull.Value ? row["Email"].ToString() : "";
                int uid = Convert.ToInt32(row["UserId"]);

                string fullName = !string.IsNullOrWhiteSpace(rawName) ? rawName : "User";
                string phone = !string.IsNullOrWhiteSpace(rawPhone) ? rawPhone : "—";
                string avatar = avatars[i % avatars.Length];
                string status = "Active";
                string statusCss = "admin-user-badge-active";
                string joined = "Active Member";

                // Populate DataTable columns
                row["FullName"] = fullName;
                row["Phone"] = phone;
                row["JoinedOn"] = joined;
                row["AvatarUrl"] = avatar;
                row["Status"] = status;
                row["StatusCssClass"] = statusCss;

                // Populate Generic Collection
                userList.Add(new UserRecord
                {
                    UserId = uid,
                    Name = rawName,
                    FullName = fullName,
                    Email = rawEmail,
                    MobileNumber = rawPhone,
                    Phone = phone,
                    Role = "Customer",
                    AvatarUrl = avatar,
                    Status = status,
                    StatusCssClass = statusCss,
                    JoinedOn = joined
                });

                i++;
            }

            if (userList.Count == 0)
            {
                rptUsers.Visible = false;
                pnlNoUsers.Visible = true;
            }
            else
            {
                rptUsers.Visible = true;
                pnlNoUsers.Visible = false;
                rptUsers.DataSource = userList;
                rptUsers.DataBind();
            }

            int total = Db.GetTotalUsers();
            lblPaginationInfo.Text = string.Format("Showing 1 to {0} of {1} users", userList.Count, total);
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
