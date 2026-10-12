using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stylio_Salon
{
    public partial class AdminUsers : Page
    {
        [Serializable]
        public class UserItem
        {
            public int UserId { get; set; }
            public string FullName { get; set; }
            public string Email { get; set; }
            public string Phone { get; set; }
            public string Status { get; set; } // "Active", "Inactive"
            public string StatusCssClass { get; set; }
            public string JoinedOn { get; set; }
            public string AvatarUrl { get; set; }
        }

        private static readonly List<UserItem> MasterUsers = new List<UserItem>
        {
            new UserItem
            {
                UserId = 1,
                FullName = "Viraj Vaja",
                Email = "viraj@gmail.com",
                Phone = "+98765 43210",
                Status = "Active",
                StatusCssClass = "admin-user-badge-active",
                JoinedOn = "08 Aug-2026",
                AvatarUrl = "~/Images/admin_icons/avatar_coral.svg"
            },
            new UserItem
            {
                UserId = 2,
                FullName = "Khush Patel",
                Email = "khush@gmail.com",
                Phone = "+98765 43210",
                Status = "Active",
                StatusCssClass = "admin-user-badge-active",
                JoinedOn = "07 Aug-2026",
                AvatarUrl = "~/Images/admin_icons/avatar_teal.svg"
            },
            new UserItem
            {
                UserId = 3,
                FullName = "Meet Patel",
                Email = "meet@gmail.com",
                Phone = "+98765 43210",
                Status = "Active",
                StatusCssClass = "admin-user-badge-active",
                JoinedOn = "06 Aug-2026",
                AvatarUrl = "~/Images/admin_icons/avatar_coral.svg"
            },
            new UserItem
            {
                UserId = 4,
                FullName = "Dev Patel",
                Email = "dev@gmail.com",
                Phone = "+98765 43210",
                Status = "Inactive",
                StatusCssClass = "admin-user-badge-inactive",
                JoinedOn = "05 Aug-2026",
                AvatarUrl = "~/Images/admin_icons/avatar_teal.svg"
            },
            new UserItem
            {
                UserId = 5,
                FullName = "Om Patel",
                Email = "om@gmail.com",
                Phone = "+98765 43210",
                Status = "Active",
                StatusCssClass = "admin-user-badge-active",
                JoinedOn = "04 Aug-2026",
                AvatarUrl = "~/Images/admin_icons/avatar_coral.svg"
            }
        };

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

                BindUsers();
            }
        }

        private void BindUsers()
        {
            string search = txtSearchUsers.Text.Trim().ToLower();

            IEnumerable<UserItem> query = MasterUsers;

            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(u => u.FullName.ToLower().Contains(search) ||
                                         u.Email.ToLower().Contains(search) ||
                                         u.Phone.ToLower().Contains(search) ||
                                         u.Status.ToLower().Contains(search));
            }

            List<UserItem> list = query.ToList();

            if (list.Count == 0)
            {
                rptUsers.Visible = false;
                pnlNoUsers.Visible = true;
            }
            else
            {
                rptUsers.Visible = true;
                pnlNoUsers.Visible = false;
                rptUsers.DataSource = list;
                rptUsers.DataBind();
            }

            lblPaginationInfo.Text = string.Format("Showing 1 to {0} of 1,245 users", list.Count);
        }

        protected void txtSearchUsers_TextChanged(object sender, EventArgs e)
        {
            BindUsers();
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
