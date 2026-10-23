using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminSalons : Page
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

                LoadSalonsFromDb();
            }
        }

        private void LoadSalonsFromDb()
        {
            DataTable dt = Db.GetAllSalons();

            // Map DB rows to the 3 static panels (keep markup unchanged)
            // Panel 1
            if (dt.Rows.Count > 0)
            {
                DataRow r = dt.Rows[0];
                pnlSalonItem1.Visible = true;
                lblSalonTitle1.Text = r["SalonName"].ToString();
                lblSalonAddress1.Text = r["Address"].ToString();
                lblSalonServices1.Text = !string.IsNullOrEmpty(r["SalonDescription"].ToString())
                    ? r["SalonDescription"].ToString()
                    : "Hair Cut, Beard, Facial";
                // Store SalonId in ViewState for delete
                ViewState["SalonId1"] = Convert.ToInt32(r["SalonId"]);
                // Image
                imgSalon1.ImageUrl = Db.ResolveSalonImage(r["SalonImage"]);
            }
            else
            {
                pnlSalonItem1.Visible = false;
            }

            // Panel 2
            if (dt.Rows.Count > 1)
            {
                DataRow r = dt.Rows[1];
                pnlSalonItem2.Visible = true;
                lblSalonTitle2.Text = r["SalonName"].ToString();
                lblSalonAddress2.Text = r["Address"].ToString();
                lblSalonServices2.Text = !string.IsNullOrEmpty(r["SalonDescription"].ToString())
                    ? r["SalonDescription"].ToString()
                    : "Hair Cut, Beard, Hair Color";
                ViewState["SalonId2"] = Convert.ToInt32(r["SalonId"]);
                imgSalon2.ImageUrl = Db.ResolveSalonImage(r["SalonImage"]);
            }
            else
            {
                pnlSalonItem2.Visible = false;
            }

            // Panel 3
            if (dt.Rows.Count > 2)
            {
                DataRow r = dt.Rows[2];
                pnlSalonItem3.Visible = true;
                lblSalonTitle3.Text = r["SalonName"].ToString();
                lblSalonAddress3.Text = r["Address"].ToString();
                lblSalonServices3.Text = !string.IsNullOrEmpty(r["SalonDescription"].ToString())
                    ? r["SalonDescription"].ToString()
                    : "Hair Cut, Beard, Hair Spa";
                ViewState["SalonId3"] = Convert.ToInt32(r["SalonId"]);
                imgSalon3.ImageUrl = Db.ResolveSalonImage(r["SalonImage"]);
            }
            else
            {
                pnlSalonItem3.Visible = false;
            }

            UpdatePaginationCount(dt.Rows.Count);
        }

        private void UpdatePaginationCount(int total)
        {
            int visibleCount = 0;
            if (pnlSalonItem1.Visible) visibleCount++;
            if (pnlSalonItem2.Visible) visibleCount++;
            if (pnlSalonItem3.Visible) visibleCount++;

            lblSalonsPaginationInfo.Text = string.Format("Showing 1 to {0} of {1} Salons", visibleCount, total);
        }

        protected void txtSearchSalons_TextChanged(object sender, EventArgs e)
        {
            string keyword = txtSearchSalons.Text.Trim().ToLower();
            if (string.IsNullOrEmpty(keyword))
            {
                LoadSalonsFromDb();
                return;
            }

            // Filter displayed panels by their label text
            bool v1 = lblSalonTitle1.Text.ToLower().Contains(keyword)
                   || lblSalonAddress1.Text.ToLower().Contains(keyword)
                   || lblSalonServices1.Text.ToLower().Contains(keyword);
            bool v2 = lblSalonTitle2.Text.ToLower().Contains(keyword)
                   || lblSalonAddress2.Text.ToLower().Contains(keyword)
                   || lblSalonServices2.Text.ToLower().Contains(keyword);
            bool v3 = lblSalonTitle3.Text.ToLower().Contains(keyword)
                   || lblSalonAddress3.Text.ToLower().Contains(keyword)
                   || lblSalonServices3.Text.ToLower().Contains(keyword);

            if (pnlSalonItem1.Visible) pnlSalonItem1.Visible = v1;
            if (pnlSalonItem2.Visible) pnlSalonItem2.Visible = v2;
            if (pnlSalonItem3.Visible) pnlSalonItem3.Visible = v3;

            UpdatePaginationCount(Db.GetTotalSalons());
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
            if (ViewState["SalonId1"] != null)
            {
                int salonId = (int)ViewState["SalonId1"];
                Db.DeleteSalon(salonId);
                ShowAlert("Salon '" + lblSalonTitle1.Text + "' has been successfully removed.");
                LoadSalonsFromDb();
            }
            else
            {
                pnlSalonItem1.Visible = false;
                UpdatePaginationCount(Db.GetTotalSalons());
                ShowAlert("Salon removed.");
            }
        }

        protected void btnRemove2_Click(object sender, EventArgs e)
        {
            if (ViewState["SalonId2"] != null)
            {
                int salonId = (int)ViewState["SalonId2"];
                Db.DeleteSalon(salonId);
                ShowAlert("Salon '" + lblSalonTitle2.Text + "' has been successfully removed.");
                LoadSalonsFromDb();
            }
            else
            {
                pnlSalonItem2.Visible = false;
                UpdatePaginationCount(Db.GetTotalSalons());
                ShowAlert("Salon removed.");
            }
        }

        protected void btnRemove3_Click(object sender, EventArgs e)
        {
            if (ViewState["SalonId3"] != null)
            {
                int salonId = (int)ViewState["SalonId3"];
                Db.DeleteSalon(salonId);
                ShowAlert("Salon '" + lblSalonTitle3.Text + "' has been successfully removed.");
                LoadSalonsFromDb();
            }
            else
            {
                pnlSalonItem3.Visible = false;
                UpdatePaginationCount(Db.GetTotalSalons());
                ShowAlert("Salon removed.");
            }
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
