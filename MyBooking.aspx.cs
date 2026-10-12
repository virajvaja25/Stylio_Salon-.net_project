using System;
using System.Data;
using System.Globalization;
using System.Web.UI.WebControls;

namespace Stylio_Salon
{
    public partial class MyBooking : System.Web.UI.Page
    {
        private int CurrentUserId
        {
            get
            {
                if (ViewState["UserId"] == null)
                {
                    string email = Session["UserEmail"] as string;
                    ViewState["UserId"] = string.IsNullOrEmpty(email) ? 0 : Db.GetUserId(email);
                }
                return (int)ViewState["UserId"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                ShowUpcomingTab();

                // Save the booking that the payment page left in Session (only once)
                string saveError;
                bool savedNow = SaveConfirmedBookingFromSession(out saveError);

                if (savedNow || Request.QueryString["booked"] == "1")
                {
                    lblStatusMessage.Visible = true;
                    lblStatusMessage.Style["color"] = "#27AE60";
                    lblStatusMessage.Text = "🎉 Payment Successful! Your booking has been confirmed.";
                }

                if (!string.IsNullOrEmpty(saveError))
                {
                    lblStatusMessage.Visible = true;
                    lblStatusMessage.Style["color"] = "#C0392B";
                    lblStatusMessage.Text = saveError;
                }

                BindBookings();
            }
        }

        // ---------------- Save booking from payment page Session ----------------
        private bool SaveConfirmedBookingFromSession(out string error)
        {
            error = null;

            if (Session["ConfirmedBookingService"] == null)
            {
                return false;
            }

            string services = Session["ConfirmedBookingService"].ToString();
            string salonName = Session["ConfirmedBookingSalon"] as string;
            string dateText = Session["ConfirmedBookingDate"] as string;
            string timeText = Session["ConfirmedBookingTime"] as string;
            string totalText = Session["ConfirmedBookingTotal"] as string;

            DateTime date;
            DateTime time;
            decimal total;

            bool dateOk = DateTime.TryParse(dateText, CultureInfo.InvariantCulture,
                                            DateTimeStyles.None, out date);
            bool timeOk = DateTime.TryParse(timeText, CultureInfo.InvariantCulture,
                                            DateTimeStyles.None, out time);
            bool totalOk = decimal.TryParse(
                (totalText ?? "").Replace("₹", "").Replace(",", "").Trim(),
                NumberStyles.Number, CultureInfo.InvariantCulture, out total);

            if (!dateOk || !timeOk || !totalOk)
            {
                error = "Booking details were not valid, so the booking was not saved.";
                return false;
            }

            int userId = CurrentUserId;
            int salonId = string.IsNullOrEmpty(salonName) ? 0 : Db.GetSalonIdByName(salonName);

            if (userId == 0 || salonId == 0)
            {
                error = "Could not find the user or salon for this booking, so it was not saved.";
                return false;
            }

            try
            {
                Db.AddBooking(userId, salonId, services, date.Date, time.TimeOfDay, total);

                // Clear Session so a refresh does not save the same booking again
                Session.Remove("ConfirmedBookingService");
                Session.Remove("ConfirmedBookingSalon");
                Session.Remove("ConfirmedBookingDate");
                Session.Remove("ConfirmedBookingTime");
                Session.Remove("ConfirmedBookingTotal");
                return true;
            }
            catch (Exception ex)
            {
                error = "Error saving booking: " + Server.HtmlEncode(ex.Message);
                return false;
            }
        }

        // ---------------- Load bookings from database ----------------
        private void BindBookings()
        {
            int userId = CurrentUserId;

            DataTable upcoming = Db.GetBookingsByUser(userId, true);
            rptUpcoming.DataSource = upcoming;
            rptUpcoming.DataBind();
            lblNoUpcoming.Visible = upcoming.Rows.Count == 0;

            DataTable past = Db.GetBookingsByUser(userId, false);
            rptPast.DataSource = past;
            rptPast.DataBind();
            lblNoPast.Visible = past.Rows.Count == 0;
        }

        // ---------------- Helpers used in the .aspx ----------------
        protected string GetImage(object image)
        {
            string file = image as string;
            if (string.IsNullOrEmpty(file))
            {
                return "~/Images/haircut_booking.jpg";   // default image
            }
            return file;
        }

        protected string FormatDateTime(object date, object time)
        {
            DateTime d = Convert.ToDateTime(date);
            TimeSpan t = (TimeSpan)time;
            return d.ToString("dd-MMM-yyyy") + " | " + DateTime.Today.Add(t).ToString("hh:mm tt");
        }

        // ---------------- Tab Handlers ----------------
        protected void btnTabUpcoming_Click(object sender, EventArgs e)
        {
            ShowUpcomingTab();
        }

        protected void btnTabPast_Click(object sender, EventArgs e)
        {
            ShowPastTab();
        }

        private void ShowUpcomingTab()
        {
            pnlUpcomingContent.Visible = true;
            pnlPastContent.Visible = false;

            btnTabUpcoming.CssClass = "booking-tab-btn booking-tab-active";
            btnTabPast.CssClass = "booking-tab-btn booking-tab-inactive";
            lblStatusMessage.Visible = false;
        }

        private void ShowPastTab()
        {
            pnlUpcomingContent.Visible = false;
            pnlPastContent.Visible = true;

            btnTabUpcoming.CssClass = "booking-tab-btn booking-tab-inactive";
            btnTabPast.CssClass = "booking-tab-btn booking-tab-active";
            lblStatusMessage.Visible = false;
        }

        // ---------------- Cancel Booking ----------------
        protected void rptUpcoming_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "cancel")
            {
                int bookingId = Convert.ToInt32(e.CommandArgument);

                try
                {
                    bool cancelled = Db.CancelBooking(bookingId, CurrentUserId);

                    lblStatusMessage.Visible = true;
                    lblStatusMessage.Style["color"] = "#C0392B";
                    lblStatusMessage.Text = cancelled
                        ? "Booking cancelled successfully."
                        : "Booking could not be cancelled.";

                    BindBookings();
                }
                catch (Exception ex)
                {
                    lblStatusMessage.Visible = true;
                    lblStatusMessage.Style["color"] = "#C0392B";
                    lblStatusMessage.Text = "Error: " + Server.HtmlEncode(ex.Message);
                }
            }
        }

        // ---------------- Navigation Handlers ----------------
        protected void lnkHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void lnkServices_Click(object sender, EventArgs e)
        {
            Response.Redirect("Services.aspx");
        }

        protected void lnkSalon_Click(object sender, EventArgs e)
        {
            Response.Redirect("Salon.aspx");
        }

        protected void lnkReviews_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reviews.aspx");
        }

        protected void lnkAboutUs_Click(object sender, EventArgs e)
        {
            Response.Redirect("AboutUs.aspx");
        }

        protected void lnkFooterMyBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyBooking.aspx");
        }
    }
}