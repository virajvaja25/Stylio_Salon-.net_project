using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminAddSalon : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only a logged-in admin can open this page
            if (Session["IsAdminLoggedIn"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                if (Session["AdminName"] != null)
                {
                    lblAdminName.Text = Session["AdminName"].ToString();
                }
            }
        }

        protected void btnAddSalon_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string owner = txtOwnerName.Text.Trim();
            string phone = txtPhoneNumber.Text.Trim();
            string email = txtEmailAddress.Text.Trim();
            string details = txtSalonDetails.Text.Trim();
            string location = txtSalonLocation.Text.Trim();
            string hours = ddlOpeningHours.SelectedValue;

            // Your form has no Salon Name box, so this uses the owner name.
            // If you add a txtSalonName textbox, use: string salonName = txtSalonName.Text.Trim();
            string salonName = owner + "'s Salon";

            if (string.IsNullOrEmpty(owner) || string.IsNullOrEmpty(phone) ||
                string.IsNullOrEmpty(email) || string.IsNullOrEmpty(location))
            {
                ShowMessage("Please enter Owner Name, Phone Number, Email and Salon Location.", false);
                return;
            }

            if (!email.Contains("@") || !email.Contains("."))
            {
                ShowMessage("Please enter a valid email address.", false);
                return;
            }

            if (phone.Length > 15)
            {
                ShowMessage("Phone number is too long (maximum 15 characters).", false);
                return;
            }

            try
            {
                bool saved = Db.AddSalon(owner, phone, email, details, location, hours, salonName, null);

                if (saved)
                {
                    ShowMessage("Salon by '" + Server.HtmlEncode(owner) + "' added successfully!", true);

                    // Clear inputs
                    txtOwnerName.Text = "";
                    txtPhoneNumber.Text = "";
                    txtEmailAddress.Text = "";
                    txtSalonDetails.Text = "";
                    txtSalonLocation.Text = "";
                    ddlOpeningHours.SelectedIndex = 0;
                    ddlStatus.SelectedIndex = 0;
                }
            }
            catch (SqlException ex)
            {
                // 2627 / 2601 = duplicate email (UNIQUE constraint on Salon.Email)
                if (ex.Number == 2627 || ex.Number == 2601)
                {
                    ShowMessage("A salon with this email already exists.", false);
                }
                else
                {
                    ShowMessage("Database error: " + Server.HtmlEncode(ex.Message), false);
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + Server.HtmlEncode(ex.Message), false);
            }
        }

        private void ShowMessage(string text, bool success)
        {
            lblMessage.Text = text;
            lblMessage.CssClass = success ? "admin-msg-success" : "admin-msg-error";
            lblMessage.Visible = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }

        protected void btnNavLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("IsAdminLoggedIn");
            Session.Remove("AdminName");
            Session.Remove("AdminEmail");
            Response.Redirect("AdminLogin.aspx?logout=1");
        }
    }
}