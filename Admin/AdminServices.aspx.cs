using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stylio_Salon
{
    public partial class AdminServices : Page
    {
        [Serializable]
        public class ServiceItem
        {
            public int ServiceId { get; set; }
            public string ServiceName { get; set; }
            public string SalonName { get; set; }
            public string Duration { get; set; }
            public string Status { get; set; } // "Active", "Inactive"
            public string StatusCssClass { get; set; }
            public string Price { get; set; }
            public string AvatarUrl { get; set; }
        }

        private static readonly List<ServiceItem> MasterServices = new List<ServiceItem>
        {
            new ServiceItem
            {
                ServiceId = 1,
                ServiceName = "Hair Cut",
                SalonName = "The Hair Studio",
                Duration = "30 Min",
                Status = "Active",
                StatusCssClass = "admin-user-badge-active",
                Price = "₹149",
                AvatarUrl = "~/Images/admin_icons/avatar_coral.svg"
            },
            new ServiceItem
            {
                ServiceId = 2,
                ServiceName = "Beard Trim",
                SalonName = "The Hair Studio",
                Duration = "20 min",
                Status = "Active",
                StatusCssClass = "admin-user-badge-active",
                Price = "₹99",
                AvatarUrl = "~/Images/admin_icons/avatar_teal.svg"
            },
            new ServiceItem
            {
                ServiceId = 3,
                ServiceName = "Hair Color",
                SalonName = "Stylio Men's Salon",
                Duration = "60 Min",
                Status = "Active",
                StatusCssClass = "admin-user-badge-active",
                Price = "₹500",
                AvatarUrl = "~/Images/admin_icons/avatar_coral.svg"
            },
            new ServiceItem
            {
                ServiceId = 4,
                ServiceName = "Facial",
                SalonName = "Stylio Men's Salon",
                Duration = "45 Min",
                Status = "Active",
                StatusCssClass = "admin-user-badge-active",
                Price = "₹600",
                AvatarUrl = "~/Images/admin_icons/avatar_teal.svg"
            },
            new ServiceItem
            {
                ServiceId = 5,
                ServiceName = "Hair Spa",
                SalonName = "The Mae Man Salon",
                Duration = "60 Min",
                Status = "Active",
                StatusCssClass = "admin-user-badge-active",
                Price = "₹299",
                AvatarUrl = "~/Images/admin_icons/avatar_coral.svg"
            }
        };

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

                BindServices();
            }
        }

        private void BindServices()
        {
            string search = txtSearchServices.Text.Trim().ToLower();

            IEnumerable<ServiceItem> query = MasterServices;

            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(s => s.ServiceName.ToLower().Contains(search) ||
                                         s.SalonName.ToLower().Contains(search) ||
                                         s.Price.ToLower().Contains(search) ||
                                         s.Duration.ToLower().Contains(search));
            }

            List<ServiceItem> list = query.ToList();

            if (list.Count == 0)
            {
                rptServices.Visible = false;
                pnlNoServices.Visible = true;
            }
            else
            {
                rptServices.Visible = true;
                pnlNoServices.Visible = false;
                rptServices.DataSource = list;
                rptServices.DataBind();
            }

            lblPaginationInfo.Text = string.Format("Showing 1 to {0} of {1} services", list.Count, list.Count);
        }

        protected void txtSearchServices_TextChanged(object sender, EventArgs e)
        {
            BindServices();
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
