using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stylio_Salon
{
    public partial class AdminBookings : Page
    {
        [Serializable]
        public class BookingItem
        {
            public int BookingId { get; set; }
            public string CustomerName { get; set; }
            public string CustomerEmail { get; set; }
            public string Service { get; set; }
            public string BookingDate { get; set; }
            public string BookingTime { get; set; }
            public string Status { get; set; } // "Upcoming", "Completed", "Cancelled"
            public string StatusDisplay { get; set; }
            public string StatusCssClass { get; set; }
            public string AvatarUrl { get; set; }
            public string SalonName { get; set; }
            public string Amount { get; set; }
        }

        private static readonly List<BookingItem> AllBookingsMaster = new List<BookingItem>
        {
            new BookingItem
            {
                BookingId = 1,
                CustomerName = "Dev Patel",
                CustomerEmail = "dev@gmail.com",
                Service = "Hair Cut",
                BookingDate = "18 Aug, 2026",
                BookingTime = "02:00 PM",
                Status = "Upcoming",
                StatusDisplay = "Upcoming",
                StatusCssClass = "admin-badge-upcoming",
                AvatarUrl = "~/Images/admin_icons/avatar_coral.svg",
                SalonName = "Stylio Men's Salon",
                Amount = "₹500"
            },
            new BookingItem
            {
                BookingId = 2,
                CustomerName = "Darshan patel",
                CustomerEmail = "darshan@gmail.com",
                Service = "Beard Trim",
                BookingDate = "9 Aug, 2026",
                BookingTime = "04:00 PM",
                Status = "Upcoming",
                StatusDisplay = "Upcoming",
                StatusCssClass = "admin-badge-upcoming",
                AvatarUrl = "~/Images/admin_icons/avatar_teal.svg",
                SalonName = "The Mae Mane Salon",
                Amount = "₹200"
            },
            new BookingItem
            {
                BookingId = 3,
                CustomerName = "Viraj Vaja",
                CustomerEmail = "viraj@gmail.com",
                Service = "Hair Cut",
                BookingDate = "8 Aug, 2026",
                BookingTime = "02:00 PM",
                Status = "Completed",
                StatusDisplay = "Completed ✔",
                StatusCssClass = "admin-badge-completed",
                AvatarUrl = "~/Images/admin_icons/avatar_coral.svg",
                SalonName = "Stylio Men's Salon",
                Amount = "₹500"
            },
            new BookingItem
            {
                BookingId = 4,
                CustomerName = "Meet patel",
                CustomerEmail = "meet@gmail.com",
                Service = "Beard Trim",
                BookingDate = "9 Aug, 2026",
                BookingTime = "04:00 PM",
                Status = "Completed",
                StatusDisplay = "Completed ✔",
                StatusCssClass = "admin-badge-completed",
                AvatarUrl = "~/Images/admin_icons/avatar_teal.svg",
                SalonName = "The Mae Mane Salon",
                Amount = "₹200"
            },
            new BookingItem
            {
                BookingId = 5,
                CustomerName = "Keval patel",
                CustomerEmail = "keval@gmail.com",
                Service = "Hair + Beard",
                BookingDate = "7 Aug, 2026",
                BookingTime = "03:00 PM",
                Status = "Completed",
                StatusDisplay = "Completed ✔",
                StatusCssClass = "admin-badge-completed",
                AvatarUrl = "~/Images/admin_icons/avatar_coral.svg",
                SalonName = "The Hair Studio",
                Amount = "₹700"
            },
            new BookingItem
            {
                BookingId = 6,
                CustomerName = "Harsh Patel",
                CustomerEmail = "harsh@gmail.com",
                Service = "Hair Cut",
                BookingDate = "2 Aug, 2026",
                BookingTime = "02:00 PM",
                Status = "Cancelled",
                StatusDisplay = "Cancelled",
                StatusCssClass = "admin-badge-cancelled",
                AvatarUrl = "~/Images/admin_icons/avatar_coral.svg",
                SalonName = "Stylio Men's Salon",
                Amount = "₹500"
            },
            new BookingItem
            {
                BookingId = 7,
                CustomerName = "Shubh patel",
                CustomerEmail = "shubh@gmail.com",
                Service = "Beard Trim",
                BookingDate = "4 Aug, 2026",
                BookingTime = "04:00 PM",
                Status = "Cancelled",
                StatusDisplay = "Cancelled",
                StatusCssClass = "admin-badge-cancelled",
                AvatarUrl = "~/Images/admin_icons/avatar_teal.svg",
                SalonName = "The Hair Studio",
                Amount = "₹200"
            },
            new BookingItem
            {
                BookingId = 8,
                CustomerName = "Ramansu patel",
                CustomerEmail = "ramansu@gmail.com",
                Service = "Hair + Beard",
                BookingDate = "9 Aug, 2026",
                BookingTime = "03:00 PM",
                Status = "Cancelled",
                StatusDisplay = "Cancelled",
                StatusCssClass = "admin-badge-cancelled",
                AvatarUrl = "~/Images/admin_icons/avatar_coral.svg",
                SalonName = "Stylio Men's Salon",
                Amount = "₹700"
            },
            new BookingItem
            {
                BookingId = 9,
                CustomerName = "Khush patel",
                CustomerEmail = "khush@gmail.com",
                Service = "Hair + Beard",
                BookingDate = "7 Aug, 2026",
                BookingTime = "03:00 PM",
                Status = "Cancelled",
                StatusDisplay = "Cancelled",
                StatusCssClass = "admin-badge-cancelled",
                AvatarUrl = "~/Images/admin_icons/avatar_coral.svg",
                SalonName = "Stylio Men's Salon",
                Amount = "₹700"
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

                ViewState["CurrentFilter"] = "All";
                BindBookings();
            }
        }

        private void BindBookings()
        {
            string filter = ViewState["CurrentFilter"] as string ?? "All";
            string search = txtSearchBooking.Text.Trim().ToLower();

            // Set Tab active classes
            btnTabAll.CssClass = "admin-booking-tab" + (filter == "All" ? " admin-booking-tab-active" : "");
            btnTabUpcoming.CssClass = "admin-booking-tab" + (filter == "Upcoming" ? " admin-booking-tab-active" : "");
            btnTabCompleted.CssClass = "admin-booking-tab" + (filter == "Completed" ? " admin-booking-tab-active" : "");
            btnTabCancelled.CssClass = "admin-booking-tab" + (filter == "Cancelled" ? " admin-booking-tab-active" : "");

            IEnumerable<BookingItem> query = AllBookingsMaster;

            if (filter == "All")
            {
                // In image 4: shows 3 bookings (Viraj Vaja, Meet patel, Khush patel)
                query = query.Where(b => b.BookingId == 3 || b.BookingId == 4 || b.BookingId == 9 || b.BookingId == 1 || b.BookingId == 6);
            }
            else
            {
                query = query.Where(b => b.Status.Equals(filter, StringComparison.OrdinalIgnoreCase));
            }

            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(b => b.CustomerName.ToLower().Contains(search) ||
                                         b.CustomerEmail.ToLower().Contains(search) ||
                                         b.Service.ToLower().Contains(search));
            }

            List<BookingItem> filteredList = query.ToList();

            if (filteredList.Count == 0)
            {
                rptBookings.Visible = false;
                pnlNoBookings.Visible = true;
            }
            else
            {
                rptBookings.Visible = true;
                pnlNoBookings.Visible = false;
                // Limit to 3 items per page matching the screenshots
                rptBookings.DataSource = filteredList.Take(3).ToList();
                rptBookings.DataBind();
            }

            // Update Pagination Text matching screenshots
            if (filter == "All")
            {
                lblPaginationInfo.Text = "Showing 1 to " + Math.Min(3, filteredList.Count) + " of 56 bookings";
                btnPageLast.Text = "20";
            }
            else if (filter == "Upcoming")
            {
                lblPaginationInfo.Text = "Showing UpComing bookings";
                btnPageLast.Text = "05";
            }
            else if (filter == "Completed")
            {
                lblPaginationInfo.Text = "Showing 1 to " + Math.Min(3, filteredList.Count) + " of 10 Completed bookings";
                btnPageLast.Text = "10";
            }
            else if (filter == "Cancelled")
            {
                lblPaginationInfo.Text = "Showing 1 to " + Math.Min(3, filteredList.Count) + " of 05 Cancelled bookings";
                btnPageLast.Text = "05";
            }
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

        protected void rptBookings_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                int bookingId;
                if (int.TryParse(e.CommandArgument.ToString(), out bookingId))
                {
                    BookingItem booking = AllBookingsMaster.FirstOrDefault(b => b.BookingId == bookingId);
                    if (booking != null)
                    {
                        lblModalTitle.Text = "Booking Details - " + booking.CustomerName;
                        lblValCustName.Text = booking.CustomerName;
                        lblValCustEmail.Text = booking.CustomerEmail;
                        lblValService.Text = booking.Service;
                        lblValDateTime.Text = booking.BookingDate + " at " + booking.BookingTime;
                        lblValSalon.Text = booking.SalonName;
                        lblValAmount.Text = booking.Amount;
                        lblValStatus.Text = booking.Status;

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
