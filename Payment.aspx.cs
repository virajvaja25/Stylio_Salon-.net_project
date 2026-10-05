using System;

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
            // If values were passed via Session from BookAppointment.aspx, use them
            if (Session["BookingDate"] != null && Session["BookingTime"] != null)
            {
                string bDate = Session["BookingDate"].ToString();
                string bTime = Session["BookingTime"].ToString();
                lblBookingDateTime.Text = string.Format("{0} &bull; {1}", bDate, bTime);

                if (Session["BookingTotal"] != null && int.TryParse(Session["BookingTotal"].ToString(), out int subtotal))
                {
                    int tax = (int)Math.Round(subtotal * 0.18);
                    int grandTotal = subtotal + tax;

                    lblTaxPrice.Text = "&#8377;" + tax;
                    lblTotalPrice.Text = "&#8377;" + grandTotal;
                    btnPayNow.Text = "Pay Now &#8377;" + grandTotal;
                }
            }
            else
            {
                // Default fallback matching screenshot
                lblSalonName.Text = "Stylio Men's Salon";
                lblBookingDateTime.Text = "15 May 2025 &bull; 10:00 AM";
                lblItem1Name.Text = "Hair Cut";
                lblItem1Price.Text = "&#8377;149";
                lblItem2Name.Text = "Beard Trim";
                lblItem2Price.Text = "&#8377;99";
                lblTaxLabel.Text = "Tax (18%)";
                lblTaxPrice.Text = "&#8377;90";
                lblTotalPrice.Text = "&#8377;338";
                btnPayNow.Text = "Pay Now &#8377;338";
            }
        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {
            pnlSuccessBox.Visible = true;
            lblSuccessTitle.Text = "Appointment Confirmed!";
            lblSuccessDesc.Text = string.Format(
                "Your appointment has been successfully booked at {0} with Cash Payment selected. You can pay {1} during your visit.",
                lblSalonName.Text,
                lblTotalPrice.Text);

            btnPayNow.Enabled = false;
            btnPayNow.Text = "Payment Reserved";
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
