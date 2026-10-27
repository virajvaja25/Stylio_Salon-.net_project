using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminBookings : Page
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

                ViewState["CurrentFilter"] = "All";
                BindBookings();
            }
        }

        private void BindBookings()
        {
            string filter = ViewState["CurrentFilter"] as string ?? "All";
            string search = txtSearchBooking.Text.Trim().ToLower();

            // Set Tab active CSS classes
            btnTabAll.CssClass = "admin-booking-tab" + (filter == "All" ? " admin-booking-tab-active" : "");
            btnTabUpcoming.CssClass = "admin-booking-tab" + (filter == "Upcoming" ? " admin-booking-tab-active" : "");
            btnTabCompleted.CssClass = "admin-booking-tab" + (filter == "Completed" ? " admin-booking-tab-active" : "");
            btnTabCancelled.CssClass = "admin-booking-tab" + (filter == "Cancelled" ? " admin-booking-tab-active" : "");

            // Load from DB
            string dbFilter = (filter == "All") ? null : filter;
            // Cancelled not stored in DB (bookings are deleted on cancel) — treat as empty
            DataTable dt;
            if (filter == "Cancelled")
            {
                dt = new DataTable();
                dt.Columns.Add("BookingId", typeof(int));
                dt.Columns.Add("CustomerName", typeof(string));
                dt.Columns.Add("CustomerEmail", typeof(string));
                dt.Columns.Add("Services", typeof(string));
                dt.Columns.Add("BookingDate", typeof(DateTime));
                dt.Columns.Add("BookingTime", typeof(TimeSpan));
                dt.Columns.Add("TotalAmount", typeof(decimal));
                dt.Columns.Add("SalonName", typeof(string));
                dt.Columns.Add("Status", typeof(string));
            }
            else
            {
                dt = Db.GetAllBookingsFiltered(filter == "All" ? null : filter);
            }

            // Add computed display columns
            dt.Columns.Add("BookingDateStr", typeof(string));
            dt.Columns.Add("BookingTimeStr", typeof(string));
            dt.Columns.Add("AmountStr", typeof(string));
            dt.Columns.Add("StatusCssClass", typeof(string));
            dt.Columns.Add("StatusDisplay", typeof(string));
            dt.Columns.Add("AvatarUrl", typeof(string));
            if (!dt.Columns.Contains("Service"))
                dt.Columns.Add("Service", typeof(string));

            string[] avatars = new[] { "~/Images/admin_icons/avatar_coral.svg", "~/Images/admin_icons/avatar_teal.svg" };
            int idx = 0;
            foreach (DataRow row in dt.Rows)
            {
                row["Service"] = row["Services"] != DBNull.Value ? row["Services"].ToString() : "";

                // Format date and time
                if (row["BookingDate"] != DBNull.Value)
                    row["BookingDateStr"] = Convert.ToDateTime(row["BookingDate"]).ToString("dd MMM, yyyy");
                else
                    row["BookingDateStr"] = "-";

                if (row["BookingTime"] != DBNull.Value)
                {
                    TimeSpan ts = (TimeSpan)row["BookingTime"];
                    DateTime dt2 = DateTime.Today.Add(ts);
                    row["BookingTimeStr"] = dt2.ToString("hh:mm tt");
                }
                else
                    row["BookingTimeStr"] = "-";

                if (row["TotalAmount"] != DBNull.Value)
                    row["AmountStr"] = "\u20B9" + Convert.ToDecimal(row["TotalAmount"]).ToString("N0");
                else
                    row["AmountStr"] = "\u20B9-";

                string status = row["Status"].ToString();
                row["StatusDisplay"] = status == "Completed" ? "Completed ✔" : status;
                row["StatusCssClass"] = status == "Upcoming" ? "admin-badge-upcoming" :
                                        status == "Completed" ? "admin-badge-completed" : "admin-badge-cancelled";
                row["AvatarUrl"] = avatars[idx % 2];
                idx++;
            }

            // Apply search filter
            DataTable filtered = dt;
            if (!string.IsNullOrEmpty(search))
            {
                DataRow[] rows = dt.Select(
                    string.Format("(CustomerName LIKE '%{0}%' OR CustomerEmail LIKE '%{0}%' OR Services LIKE '%{0}%')", search.Replace("'", "''"))
                );
                filtered = dt.Clone();
                foreach (DataRow r in rows) filtered.ImportRow(r);
            }

            if (filtered.Rows.Count == 0)
            {
                rptBookings.Visible = false;
                pnlNoBookings.Visible = true;
            }
            else
            {
                rptBookings.Visible = true;
                pnlNoBookings.Visible = false;
                rptBookings.DataSource = filtered;
                rptBookings.DataBind();
            }

            lblPaginationInfo.Text = string.Format("Showing 1 to {0} of {1} bookings",
                filtered.Rows.Count, Db.GetTotalBookings());
            btnPageLast.Text = Db.GetTotalBookings().ToString();
        }

        protected void btnTabAll_Click(object sender, EventArgs e)
        {
            ViewState["CurrentFilter"] = "All";
            BindBookings();
        }

        protected void btnTabUpcoming_Click(object sender, EventArgs e)
        {
            ViewState["CurrentFilter"] = "Upcoming";
            BindBookings();
        }

        protected void btnTabCompleted_Click(object sender, EventArgs e)
        {
            ViewState["CurrentFilter"] = "Completed";
            BindBookings();
        }

        protected void btnTabCancelled_Click(object sender, EventArgs e)
        {
            ViewState["CurrentFilter"] = "Cancelled";
            BindBookings();
        }

        protected void txtSearchBooking_TextChanged(object sender, EventArgs e)
        {
            BindBookings();
        }

        protected void rptBookings_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                int bookingId;
                if (int.TryParse(e.CommandArgument.ToString(), out bookingId))
                {
                    // Find row in the last-bound DataTable by re-loading
                    DataTable dt = Db.GetAllBookings();
                    DataRow[] rows = dt.Select("BookingId = " + bookingId);
                    if (rows.Length > 0)
                    {
                        DataRow booking = rows[0];
                        lblModalTitle.Text = "Booking Details - " + booking["CustomerName"];
                        lblValCustName.Text = booking["CustomerName"].ToString();
                        lblValCustEmail.Text = booking["CustomerEmail"].ToString();
                        lblValService.Text = booking["Services"].ToString();

                        string dateStr = booking["BookingDate"] != DBNull.Value
                            ? Convert.ToDateTime(booking["BookingDate"]).ToString("dd MMM, yyyy") : "-";
                        string timeStr = booking["BookingTime"] != DBNull.Value
                            ? DateTime.Today.Add((TimeSpan)booking["BookingTime"]).ToString("hh:mm tt") : "-";
                        lblValDateTime.Text = dateStr + " at " + timeStr;
                        lblValSalon.Text = booking["SalonName"].ToString();
                        lblValAmount.Text = booking["TotalAmount"] != DBNull.Value
                            ? "\u20B9" + Convert.ToDecimal(booking["TotalAmount"]).ToString("N0") : "-";
                        lblValStatus.Text = booking["Status"].ToString();

                        pnlBookingDetailsModal.Visible = true;
                    }
                }
            }
        }

        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            pnlBookingDetailsModal.Visible = false;
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
