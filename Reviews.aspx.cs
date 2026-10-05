using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Stylio_Salon
{
    public partial class ReviewsPage : System.Web.UI.Page
    {
        private static readonly List<Review> SubmittedReviews = new List<Review>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Default 5-star selected
                SetStarRating(5);
            }
        }

        // ---------------- Star Rating Selection ----------------
        protected void Star_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            if (btn != null && int.TryParse(btn.CommandArgument, out int rating))
            {
                SetStarRating(rating);
            }
        }

        private void SetStarRating(int rating)
        {
            lblSelectedRating.Text = rating.ToString();

            btnStar1.CssClass = rating >= 1 ? "star-btn" : "star-btn star-btn-empty";
            btnStar2.CssClass = rating >= 2 ? "star-btn" : "star-btn star-btn-empty";
            btnStar3.CssClass = rating >= 3 ? "star-btn" : "star-btn star-btn-empty";
            btnStar4.CssClass = rating >= 4 ? "star-btn" : "star-btn star-btn-empty";
            btnStar5.CssClass = rating >= 5 ? "star-btn" : "star-btn star-btn-empty";
        }

        // ---------------- Submit Review Handler ----------------
        protected void btnSubmitReview_Click(object sender, EventArgs e)
        {
            string reviewText = txtReviewComment.Text.Trim();
            if (string.IsNullOrEmpty(reviewText))
            {
                pnlReviewSuccess.Visible = true;
                pnlReviewSuccess.CssClass = "review-success-panel";
                lblSuccessMessage.Text = "Please write a review before submitting.";
                lblSuccessMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string reviewerName = Session["UserName"] as string ?? "Khush Dobariya";
            int rating = int.TryParse(lblSelectedRating.Text, out int r) ? r : 5;

            SubmittedReviews.Add(new Review
            {
                Name = reviewerName,
                Comment = reviewText,
                AvatarUrl = "~/Images/DefaultScreen/reviewer1.png"
            });

            pnlReviewSuccess.Visible = true;
            lblSuccessMessage.ForeColor = System.Drawing.Color.FromArgb(46, 125, 50);
            lblSuccessMessage.Text = "Thank you! Your " + rating + "-star review has been submitted successfully.";
            txtReviewComment.Text = string.Empty;
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
