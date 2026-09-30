using System;

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
                CheckAuth();
                PrepopulateFromQueryString();
            }
        }

        private void CheckAuth()
        {
            bool isLoggedIn = Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"];
            if (isLoggedIn)
            {
                btnLogin.Visible = false;
                btnRegister.Text = "Logout (" + (Session["UserName"] as string ?? "User") + ")";
                btnRegister.CssClass = "btn-nav-login";
                btnRegister.Click -= btnRegister_Click;
                btnRegister.Click += (s, ev) =>
                {
                    Session.Clear();
                    Session.Abandon();
                    Response.Redirect("guest.aspx");
                };

                if (Session["UserName"] != null)
                {
                    txtName.Text = Session["UserName"].ToString();
                }
            }
        }

        private void PrepopulateFromQueryString()
        {
            string salonId = Request.QueryString["salonId"];
            if (!string.IsNullOrEmpty(salonId))
            {
                var item = ddlSalon.Items.FindByValue(salonId);
                if (item != null)
                {
                    ddlSalon.SelectedValue = salonId;
                }
            }

            string serviceName = Request.QueryString["service"];
            if (!string.IsNullOrEmpty(serviceName))
            {
                foreach (System.Web.UI.WebControls.ListItem item in ddlService.Items)
                {
                    if (serviceName.IndexOf(item.Value, StringComparison.OrdinalIgnoreCase) >= 0)
                    {
                        item.Selected = true;
                        break;
                    }
                }
            }

            txtDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
        }

        protected void btnSubmitBooking_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string salon = ddlSalon.SelectedItem != null ? ddlSalon.SelectedItem.Text : "Selected Salon";
            string service = ddlService.SelectedItem != null ? ddlService.SelectedItem.Text : "Selected Service";
            string date = txtDate.Text;
            string time = ddlTimeSlot.SelectedValue;
            string clientName = txtName.Text.Trim();

            pnlForm.Visible = false;
            pnlSuccess.Visible = true;
            lblSuccessMessage.Text = string.Format(
                "Thank you, <strong>{0}</strong>! Your appointment for <strong>{1}</strong> at <strong>{2}</strong> on <strong>{3}</strong> ({4}) has been reserved. A confirmation SMS will be sent to your mobile number.",
                Server.HtmlEncode(clientName),
                Server.HtmlEncode(service),
                Server.HtmlEncode(salon),
                Server.HtmlEncode(date),
                Server.HtmlEncode(time));
        }

        protected void lnkHome_Click(object sender, EventArgs e)
        {
            bool isLoggedIn = Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"];
            Response.Redirect(isLoggedIn ? "Default.aspx" : "guest.aspx");
        }

        protected void lnkSalon_Click(object sender, EventArgs e)
        {
            Response.Redirect("Salon.aspx");
        }

        protected void lnkServices_Click(object sender, EventArgs e)
        {
            Response.Redirect("Services.aspx");
        }

        protected void lnkReviews_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reviews.aspx");
        }

        protected void lnkAboutUs_Click(object sender, EventArgs e)
        {
            Response.Redirect("AboutUs.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}
