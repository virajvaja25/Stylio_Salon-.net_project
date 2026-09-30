using System;
using System.Collections.Generic;

namespace Stylio_Salon
{
    public partial class ReviewsPage : System.Web.UI.Page
    {
        private static readonly List<Review> AllReviews = new List<Review>
        {
            new Review
            {
                Name = "Khush Patel",
                Comment = "Great Experience! Very Professional Staff and Clean Environment.",
                AvatarUrl = "~/Images/DefaultScreen/reviewer1.png"
            },
            new Review
            {
                Name = "Viraj Vaja",
                Comment = "Loved The Haircut and Service, Highly Recommended!",
                AvatarUrl = "~/Images/DefaultScreen/reviewer1.png"
            },
            new Review
            {
                Name = "Meet Patel",
                Comment = "Best Salon in Town! The styling was modern and the waiting time was zero.",
                AvatarUrl = "~/Images/DefaultScreen/reviewer1.png"
            },
            new Review
            {
                Name = "Aman Sharma",
                Comment = "Superb beard grooming and facial package. Very relaxing vibe and gentle staff.",
                AvatarUrl = "~/Images/DefaultScreen/reviewer1.png"
            }
        };

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
                BindReviews();
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
                    txtReviewerName.Text = Session["UserName"].ToString();
                }
            }
        }

        private void BindReviews()
        {
            rptReviewsList.DataSource = AllReviews;
            rptReviewsList.DataBind();
        }

        protected void btnSubmitReview_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string reviewerName = txtReviewerName.Text.Trim();
            string comment = txtReviewComment.Text.Trim();

            AllReviews.Insert(0, new Review
            {
                Name = reviewerName,
                Comment = comment,
                AvatarUrl = "~/Images/DefaultScreen/reviewer1.png"
            });

            pnlReviewSuccess.Visible = true;
            txtReviewComment.Text = string.Empty;

            BindReviews();
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
