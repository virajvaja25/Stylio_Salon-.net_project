using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminPayments : Page
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

                LoadPaymentStats();
            }
        }

        private void LoadPaymentStats()
        {
            // Load total revenue and users from database
            decimal totalRevenue = Db.GetTotalRevenue();
            int totalUsers = Db.GetTotalUsers();

            lblTotalValue.Text = "\u20B9" + totalRevenue.ToString("N0");
            lblTodayValue.Text = "\u20B9" + totalRevenue.ToString("N0");
            lblNewUsersValue.Text = totalUsers.ToString("N0");
        }

        private void ShowReceiptModal(string txnId, string customer, string service, string amount, string method, string date)
        {
            lblModalTitle.Text = "Payment Receipt - " + customer;
            lblValTxnId.Text = txnId;
            lblValCustomer.Text = customer;
            lblValService.Text = service;
            lblValAmount.Text = amount;
            lblValMethod.Text = method;
            lblValDate.Text = date;
            lblValStatus.Text = "Completed ✔";
            pnlPaymentDetailsModal.Visible = true;
        }

        protected void btnDetails1_Click(object sender, EventArgs e)
        {
            ShowReceiptModal("#TXN-20260808-01", lblCustName1.Text, lblService1.Text, lblAmount1.Text, lblMethod1.Text, lblDate1.Text);
        }

        protected void btnDetails2_Click(object sender, EventArgs e)
        {
            ShowReceiptModal("#TXN-20260809-02", lblCustName2.Text, lblService2.Text, lblAmount2.Text, lblMethod2.Text, lblDate2.Text);
        }

        protected void btnDetails3_Click(object sender, EventArgs e)
        {
            ShowReceiptModal("#TXN-20260809-03", lblCustName3.Text, lblService3.Text, lblAmount3.Text, lblMethod3.Text, lblDate3.Text);
        }

        protected void btnDetails4_Click(object sender, EventArgs e)
        {
            ShowReceiptModal("#TXN-20260807-04", lblCustName4.Text, lblService4.Text, lblAmount4.Text, lblMethod4.Text, lblDate4.Text);
        }

        protected void btnDetails5_Click(object sender, EventArgs e)
        {
            ShowReceiptModal("#TXN-20260812-05", lblCustName5.Text, lblService5.Text, lblAmount5.Text, lblMethod5.Text, lblDate5.Text);
        }

        protected void btnPrint1_Click(object sender, EventArgs e)
        {
            ShowReceiptModal("#TXN-20260808-01", lblCustName1.Text, lblService1.Text, lblAmount1.Text, lblMethod1.Text, lblDate1.Text);
            ClientScript.RegisterStartupScript(this.GetType(), "PrintReceipt", "window.print();", true);
        }

        protected void btnPrint2_Click(object sender, EventArgs e)
        {
            ShowReceiptModal("#TXN-20260809-02", lblCustName2.Text, lblService2.Text, lblAmount2.Text, lblMethod2.Text, lblDate2.Text);
            ClientScript.RegisterStartupScript(this.GetType(), "PrintReceipt", "window.print();", true);
        }

        protected void btnPrint3_Click(object sender, EventArgs e)
        {
            ShowReceiptModal("#TXN-20260809-03", lblCustName3.Text, lblService3.Text, lblAmount3.Text, lblMethod3.Text, lblDate3.Text);
            ClientScript.RegisterStartupScript(this.GetType(), "PrintReceipt", "window.print();", true);
        }

        protected void btnPrint4_Click(object sender, EventArgs e)
        {
            ShowReceiptModal("#TXN-20260807-04", lblCustName4.Text, lblService4.Text, lblAmount4.Text, lblMethod4.Text, lblDate4.Text);
            ClientScript.RegisterStartupScript(this.GetType(), "PrintReceipt", "window.print();", true);
        }

        protected void btnPrint5_Click(object sender, EventArgs e)
        {
            ShowReceiptModal("#TXN-20260812-05", lblCustName5.Text, lblService5.Text, lblAmount5.Text, lblMethod5.Text, lblDate5.Text);
            ClientScript.RegisterStartupScript(this.GetType(), "PrintReceipt", "window.print();", true);
        }

        protected void btnComplete1_Click(object sender, EventArgs e)
        {
            ShowAlert("Payment of " + lblAmount1.Text + " for " + lblCustName1.Text + " marked as Completed successfully.");
        }

        protected void btnComplete2_Click(object sender, EventArgs e)
        {
            ShowAlert("Payment of " + lblAmount2.Text + " for " + lblCustName2.Text + " marked as Completed successfully.");
        }

        protected void btnComplete3_Click(object sender, EventArgs e)
        {
            ShowAlert("Payment of " + lblAmount3.Text + " for " + lblCustName3.Text + " marked as Completed successfully.");
        }

        protected void btnComplete4_Click(object sender, EventArgs e)
        {
            ShowAlert("Payment of " + lblAmount4.Text + " for " + lblCustName4.Text + " marked as Completed successfully.");
        }

        protected void btnComplete5_Click(object sender, EventArgs e)
        {
            ShowAlert("Payment of " + lblAmount5.Text + " for " + lblCustName5.Text + " marked as Completed successfully.");
        }

        private void ShowAlert(string msg)
        {
            lblAlertMessage.Text = msg;
            pnlAlertBanner.Visible = true;
        }

        protected void btnCloseAlert_Click(object sender, EventArgs e)
        {
            pnlAlertBanner.Visible = false;
        }

        protected void btnCloseDetails_Click(object sender, EventArgs e)
        {
            pnlPaymentDetailsModal.Visible = false;
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
