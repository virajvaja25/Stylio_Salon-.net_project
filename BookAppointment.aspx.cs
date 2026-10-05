using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stylio_Salon
{
    public partial class BookAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Initialize calendar to September 2025 (matching design) or current date
                int initialYear = 2025;
                int initialMonth = 9;
                calBooking.VisibleDate = new DateTime(initialYear, initialMonth, 1);
                calBooking.SelectedDate = new DateTime(initialYear, initialMonth, 9); // Day 9 selected as in screenshot

                ddlCalYear.SelectedValue = initialYear.ToString();
                ddlCalMonth.SelectedValue = initialMonth.ToString();
                lblSelectedDateDisplay.Text = calBooking.SelectedDate.ToString("yyyy-MM-dd");

                // Default time slot selection
                SetSelectedTimeSlot("btnTime1000AM");
            }
        }

        // ---------------- Calendar Month / Year Handlers ----------------
        protected void ddlCalMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateCalendarDate();
        }

        protected void ddlCalYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateCalendarDate();
        }

        protected void btnCalPrev_Click(object sender, EventArgs e)
        {
            DateTime current = calBooking.VisibleDate;
            if (current == DateTime.MinValue) current = DateTime.Today;
            DateTime prevMonth = current.AddMonths(-1);

            SetCalendarMonthYear(prevMonth);
        }

        protected void btnCalNext_Click(object sender, EventArgs e)
        {
            DateTime current = calBooking.VisibleDate;
            if (current == DateTime.MinValue) current = DateTime.Today;
            DateTime nextMonth = current.AddMonths(1);

            SetCalendarMonthYear(nextMonth);
        }

        private void SetCalendarMonthYear(DateTime targetDate)
        {
            string monthVal = targetDate.Month.ToString();
            string yearVal = targetDate.Year.ToString();

            if (ddlCalMonth.Items.FindByValue(monthVal) != null)
                ddlCalMonth.SelectedValue = monthVal;

            if (ddlCalYear.Items.FindByValue(yearVal) != null)
                ddlCalYear.SelectedValue = yearVal;

            calBooking.VisibleDate = new DateTime(targetDate.Year, targetDate.Month, 1);
        }

        private void UpdateCalendarDate()
        {
            int year = int.Parse(ddlCalYear.SelectedValue);
            int month = int.Parse(ddlCalMonth.SelectedValue);
            calBooking.VisibleDate = new DateTime(year, month, 1);
        }

        protected void calBooking_SelectionChanged(object sender, EventArgs e)
        {
            lblSelectedDateDisplay.Text = calBooking.SelectedDate.ToString("yyyy-MM-dd");
        }

        // ---------------- Time Slot Handlers ----------------
        protected void TimeSlot_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            if (btn != null)
            {
                SetSelectedTimeSlot(btn.ID);
            }
        }

        private void SetSelectedTimeSlot(string buttonId)
        {
            // Reset all time slot button classes
            ResetTimeButtonClasses();

            LinkButton targetBtn = FindControl(buttonId) as LinkButton;
            if (targetBtn != null)
            {
                targetBtn.CssClass = "time-slot-btn time-slot-btn-selected";
                lblSelectedTimeDisplay.Text = targetBtn.Text;
            }
        }

        private void ResetTimeButtonClasses()
        {
            btnTime0900AM.CssClass = "time-slot-btn";
            btnTime1000AM.CssClass = "time-slot-btn";
            btnTime1100AM.CssClass = "time-slot-btn";
            btnTime1200PM.CssClass = "time-slot-btn";

            btnTime0100PM.CssClass = "time-slot-btn";
            btnTime0200PM.CssClass = "time-slot-btn";
            btnTime0300PM.CssClass = "time-slot-btn";
            btnTime0400PM.CssClass = "time-slot-btn";

            btnTime0500PM.CssClass = "time-slot-btn";
            btnTime0600PM.CssClass = "time-slot-btn";
            btnTime0700PM.CssClass = "time-slot-btn";
            btnTime0800PM.CssClass = "time-slot-btn";
        }

        // ---------------- Next Button Click ----------------
        protected void btnNext_Click(object sender, EventArgs e)
        {
            List<string> selectedServices = new List<string>();
            int total = 0;

            if (chkHairCut.Checked)   { selectedServices.Add("Hair Cut (₹149)"); total += 149; }
            if (chkBeardTrim.Checked) { selectedServices.Add("Beard Trim (₹99)"); total += 99; }
            if (chkHairColor.Checked) { selectedServices.Add("Hair Color (₹299)"); total += 299; }
            if (chkFacial.Checked)    { selectedServices.Add("Facial (₹135)"); total += 135; }
            if (chkHairSpa.Checked)   { selectedServices.Add("Hair Spa (₹399)"); total += 399; }

            if (selectedServices.Count == 0)
            {
                pnlBookingFeedback.Visible = true;
                lblFeedbackMessage.Text = "Please select at least one service.";
                lblFeedbackMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string selectedDate = string.IsNullOrEmpty(lblSelectedDateDisplay.Text)
                ? calBooking.SelectedDate.ToString("yyyy-MM-dd")
                : lblSelectedDateDisplay.Text;

            string selectedTime = string.IsNullOrEmpty(lblSelectedTimeDisplay.Text)
                ? "10:00 AM"
                : lblSelectedTimeDisplay.Text;

            // Store in Session for payment / confirmation
            Session["BookingServices"] = string.Join(", ", selectedServices);
            Session["BookingDate"] = selectedDate;
            Session["BookingTime"] = selectedTime;
            Session["BookingTotal"] = total;

            Response.Redirect("Payment.aspx");
        }

        // ---------------- Navigation ----------------
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
            Response.Redirect("BookAppointment.aspx");
        }
    }
}
