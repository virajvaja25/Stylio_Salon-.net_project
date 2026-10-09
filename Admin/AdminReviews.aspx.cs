using System;
using System.Web;
using System.Web.UI;

namespace Stylio_Salon
{
    public partial class AdminReviews : Page
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
            }
        }

        protected void txtSearchReviews_TextChanged(object sender, EventArgs e)
        {
            string keyword = txtSearchReviews.Text.Trim().ToLower();
            if (string.IsNullOrEmpty(keyword))
            {
                pnlReviewRow1.Visible = true;
                pnlReviewRow2.Visible = true;
                pnlReviewRow3.Visible = true;
                pnlReviewRow4.Visible = true;
                pnlReviewRow5.Visible = true;
                return;
            }

            pnlReviewRow1.Visible = lblUserName1.Text.ToLower().Contains(keyword) || lblSalonName1.Text.ToLower().Contains(keyword) || lblText1.Text.ToLower().Contains(keyword);
            pnlReviewRow2.Visible = lblUserName2.Text.ToLower().Contains(keyword) || lblSalonName2.Text.ToLower().Contains(keyword) || lblText2.Text.ToLower().Contains(keyword);
            pnlReviewRow3.Visible = lblUserName3.Text.ToLower().Contains(keyword) || lblSalonName3.Text.ToLower().Contains(keyword) || lblText3.Text.ToLower().Contains(keyword);
            pnlReviewRow4.Visible = lblUserName4.Text.ToLower().Contains(keyword) || lblSalonName4.Text.ToLower().Contains(keyword) || lblText4.Text.ToLower().Contains(keyword);
            pnlReviewRow5.Visible = lblUserName5.Text.ToLower().Contains(keyword) || lblSalonName5.Text.ToLower().Contains(keyword) || lblText5.Text.ToLower().Contains(keyword);
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
