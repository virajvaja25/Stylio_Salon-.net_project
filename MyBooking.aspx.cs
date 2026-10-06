using System;
using System.Web.UI.WebControls;

namespace Stylio_Salon
{
    public partial class MyBooking : System.Web.UI.Page
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
                ShowUpcomingTab();

                if (Request.QueryString["booked"] == "1" || Session["ConfirmedBookingService"] != null)
                {
                    lblStatusMessage.Visible = true;
                    lblStatusMessage.Style["color"] = "#27AE60";
                    lblStatusMessage.Text = "🎉 Payment Successful! Your booking has been confirmed.";

                    if (Session["ConfirmedBookingService"] != null)
                    {
                        pnlConfirmedCard.Visible = true;
                        lblConfirmedTitle.Text = Session["ConfirmedBookingService"].ToString();
                        string bDate = Session["ConfirmedBookingDate"] as string ?? "25-May-2026";
                        string bTime = Session["ConfirmedBookingTime"] as string ?? "04:30 PM";
                        lblConfirmedDateTime.Text = bDate + " | " + bTime;
                        string total = Session["ConfirmedBookingTotal"] as string ?? "₹338";
                        lblConfirmedTotal.Text = "Total Paid: " + total;
                        imgConfirmed.ImageUrl = "~/Images/new_booking.jpg";
                    }
                }
            }
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

        // ---------------- Cancel Booking Handler ----------------
        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            if (btn != null)
            {
                string arg = btn.CommandArgument;
                if (arg == "confirmed")
                {
                    pnlConfirmedCard.Visible = false;
                    Session.Remove("ConfirmedBookingService");
                }
                else if (arg == "1")
                {
                    pnlUpCard1.Visible = false;
                }
                else if (arg == "2")
                {
                    pnlUpCard2.Visible = false;
                }

                lblStatusMessage.Visible = true;
                lblStatusMessage.Style["color"] = "#C0392B";
                lblStatusMessage.Text = "Booking cancelled successfully.";
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
