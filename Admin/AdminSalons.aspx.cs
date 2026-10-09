using System;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminSalons : Page
    {
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
                UpdatePaginationCount();
            }
        }

        private void UpdatePaginationCount()
        {
            int visibleCount = 0;
            if (pnlSalonItem1.Visible) visibleCount++;
            if (pnlSalonItem2.Visible) visibleCount++;
            if (pnlSalonItem3.Visible) visibleCount++;

            lblSalonsPaginationInfo.Text = string.Format("Showing 1 to {0} of Salons", visibleCount);
        }

        protected void txtSearchSalons_TextChanged(object sender, EventArgs e)
        {
            string keyword = txtSearchSalons.Text.Trim().ToLower();
            if (string.IsNullOrEmpty(keyword))
            {
                pnlSalonItem1.Visible = true;
                pnlSalonItem2.Visible = true;
                pnlSalonItem3.Visible = true;
            }
            else
            {
                pnlSalonItem1.Visible = lblSalonTitle1.Text.ToLower().Contains(keyword) || lblSalonAddress1.Text.ToLower().Contains(keyword) || lblSalonServices1.Text.ToLower().Contains(keyword);
                pnlSalonItem2.Visible = lblSalonTitle2.Text.ToLower().Contains(keyword) || lblSalonAddress2.Text.ToLower().Contains(keyword) || lblSalonServices2.Text.ToLower().Contains(keyword);
                pnlSalonItem3.Visible = lblSalonTitle3.Text.ToLower().Contains(keyword) || lblSalonAddress3.Text.ToLower().Contains(keyword) || lblSalonServices3.Text.ToLower().Contains(keyword);
            }
            UpdatePaginationCount();
        }

        protected void btnDetails1_Click(object sender, EventArgs e)
        {
            lblModalTitle.Text = "Salon Details - " + lblSalonTitle1.Text;
            imgModalSalonPhoto.ImageUrl = imgSalon1.ImageUrl;
            lblValName.Text = lblSalonTitle1.Text;
            lblValOwner.Text = "Viraj Vaja";
            lblValAddress.Text = lblSalonAddress1.Text;
            lblValServices.Text = lblSalonServices1.Text;
            lblValRating.Text = lblRating1.Text + " / 5.0";
            lblValStatus.Text = "Active";

            pnlSalonDetailsModal.Visible = true;
        }

        protected void btnDetails2_Click(object sender, EventArgs e)
        {
            lblModalTitle.Text = "Salon Details - " + lblSalonTitle2.Text;
            imgModalSalonPhoto.ImageUrl = imgSalon2.ImageUrl;
            lblValName.Text = lblSalonTitle2.Text;
            lblValOwner.Text = "Mae Mane";
            lblValAddress.Text = lblSalonAddress2.Text;
            lblValServices.Text = lblSalonServices2.Text;
            lblValRating.Text = lblRating2.Text + " / 5.0";
            lblValStatus.Text = "Active";

            pnlSalonDetailsModal.Visible = true;
        }

        protected void btnDetails3_Click(object sender, EventArgs e)
        {
            lblModalTitle.Text = "Salon Details - " + lblSalonTitle3.Text;
            imgModalSalonPhoto.ImageUrl = imgSalon3.ImageUrl;
            lblValName.Text = lblSalonTitle3.Text;
            lblValOwner.Text = "The Hair Studio Team";
            lblValAddress.Text = lblSalonAddress3.Text;
            lblValServices.Text = lblSalonServices3.Text;
            lblValRating.Text = lblRating3.Text + " / 5.0";
            lblValStatus.Text = "Active";

            pnlSalonDetailsModal.Visible = true;
        }

        protected void btnCloseDetails_Click(object sender, EventArgs e)
        {
            pnlSalonDetailsModal.Visible = false;
        }

        protected void btnRemove1_Click(object sender, EventArgs e)
        {
            pnlSalonItem1.Visible = false;
            UpdatePaginationCount();
            ShowAlert("Salon '" + lblSalonTitle1.Text + "' has been successfully removed.");
        }

        protected void btnRemove2_Click(object sender, EventArgs e)
        {
            pnlSalonItem2.Visible = false;
            UpdatePaginationCount();
            ShowAlert("Salon '" + lblSalonTitle2.Text + "' has been successfully removed.");
        }

        protected void btnRemove3_Click(object sender, EventArgs e)
        {
            pnlSalonItem3.Visible = false;
            UpdatePaginationCount();
            ShowAlert("Salon '" + lblSalonTitle3.Text + "' has been successfully removed.");
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
