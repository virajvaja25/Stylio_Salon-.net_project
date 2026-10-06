using System;
using System.Collections.Generic;

namespace Stylio_Salon
{
    public partial class Payment : System.Web.UI.Page
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
                LoadBookingSummary();
            }
        }

        private void LoadBookingSummary()
        {
            var selectedItems = Session["SelectedServicesList"] as List<BookingServiceItem>;

            if (selectedItems != null && selectedItems.Count > 0)
            {
                rptSummaryItems.DataSource = selectedItems;
                rptSummaryItems.DataBind();

                string bDate = Session["BookingDate"] as string ?? "15 May 2026";
                string bTime = Session["BookingTime"] as string ?? "10:00 AM";
                lblBookingDateTime.Text = string.Format("{0} &bull; {1}", bDate, bTime);

                int subtotal = 0;
                if (Session["BookingSubtotal"] != null && int.TryParse(Session["BookingSubtotal"].ToString(), out int sTotal))
                {
                    subtotal = sTotal;
                }
                else
                {
                    foreach (var item in selectedItems) subtotal += item.Price;
                }

                int tax = (int)Math.Round(subtotal * 0.18);
                int grandTotal = subtotal + tax;

                string salonName = Session["BookingSalonName"] as string ?? "Stylio Men's Salon";
                lblSalonName.Text = salonName;
                lblTaxPrice.Text = "₹" + tax;
                lblTotalPrice.Text = "₹" + grandTotal;
                btnPayNow.Text = "Pay Now ₹" + grandTotal;
            }
            else
            {
                // Fallback default matching design
                var defaultList = new List<BookingServiceItem>
                {
                    new BookingServiceItem { Name = "Hair Cut", Price = 149 },
                    new BookingServiceItem { Name = "Beard Trim", Price = 99 }
                };
                rptSummaryItems.DataSource = defaultList;
                rptSummaryItems.DataBind();

                string salonName = Session["BookingSalonName"] as string ?? "Stylio Men's Salon";
                lblSalonName.Text = salonName;
                lblBookingDateTime.Text = "15 May 2025 &bull; 10:00 AM";
                lblTaxLabel.Text = "Tax (18%)";
                lblTaxPrice.Text = "₹90";
                lblTotalPrice.Text = "₹338";
                btnPayNow.Text = "Pay Now ₹338";
            }
        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {
            var selectedItems = Session["SelectedServicesList"] as List<BookingServiceItem>;
            string servicesSummary = "Hair Cut";
            if (selectedItems != null && selectedItems.Count > 0)
            {
                var names = new List<string>();
                foreach (var it in selectedItems) names.Add(it.Name);
                servicesSummary = string.Join(", ", names);
            }

            string bDate = Session["BookingDate"] as string ?? "25-May-2026";
            string bTime = Session["BookingTime"] as string ?? "04:30 PM";
            string totalStr = lblTotalPrice.Text;
            string bSalon = Session["BookingSalonName"] as string ?? "Stylio Men's Salon";

            // Store confirmed booking in session to display in MyBooking.aspx
            Session["ConfirmedBookingSalon"] = bSalon;
            Session["ConfirmedBookingService"] = servicesSummary;
            Session["ConfirmedBookingDate"] = bDate;
            Session["ConfirmedBookingTime"] = bTime;
            Session["ConfirmedBookingTotal"] = totalStr;

            // Redirect to My Booking showing the confirmed booking
            Response.Redirect("MyBooking.aspx?booked=1");
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
            Response.Redirect("MyBooking.aspx");
        }
    }
}
