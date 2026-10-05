<%@ Page Title="Stylio | Write a Review" Language="C#" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="Stylio_Salon.ReviewsPage" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Write a Review</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
    <link rel="stylesheet" type="text/css" href="Styles/Reviews.css" />
</head>
<body>
    <form id="frmReviews" runat="server">

        <!-- ===================== HEADER ===================== -->
        <asp:Panel ID="pnlHeader" runat="server" CssClass="header">

            <asp:Panel ID="pnlLogoArea" runat="server" CssClass="logo-area">
                <asp:Image ID="imgLogo" runat="server"
                    ImageUrl="~/Images/DefaultScreen/logo.png"
                    AlternateText="Stylio Logo" CssClass="logo-img" />
            </asp:Panel>

            <asp:Panel ID="pnlNav" runat="server" CssClass="nav-links">
                <asp:LinkButton ID="lnkHome" runat="server" Text="Home" CssClass="nav-link" OnClick="lnkHome_Click" />
                <asp:LinkButton ID="lnkServices" runat="server" Text="Services" CssClass="nav-link" OnClick="lnkServices_Click" />
                <asp:LinkButton ID="lnkSalon" runat="server" Text="Salon" CssClass="nav-link" OnClick="lnkSalon_Click" />
                <asp:LinkButton ID="lnkReviews" runat="server" Text="Reviews" CssClass="nav-link nav-link-active" OnClick="lnkReviews_Click" />
                <asp:LinkButton ID="lnkAboutUs" runat="server" Text="About Us" CssClass="nav-link" OnClick="lnkAboutUs_Click" />
            </asp:Panel>

        </asp:Panel>

        <!-- ===================== MAIN CONTAINER ===================== -->
        <asp:Panel ID="pnlReviewPage" runat="server" CssClass="review-page-container">

            <!-- Title -->
            <asp:Label ID="lblPageTitle" runat="server" CssClass="review-main-title" Text="Write a Review" />

            <!-- White Card -->
            <asp:Panel ID="pnlReviewCard" runat="server" CssClass="review-card-container">

                <!-- Salon Information Header -->
                <asp:Panel ID="pnlSalonInfoRow" runat="server" CssClass="salon-info-row">
                    <asp:Image ID="imgSalonThumb" runat="server"
                        ImageUrl="~/Images/SalonScreen/salon1.png"
                        AlternateText="Stylio Men's Salon"
                        CssClass="salon-thumb-img" />

                    <asp:Panel ID="pnlSalonInfoTexts" runat="server" CssClass="salon-info-texts">
                        <asp:Label ID="lblSalonName" runat="server" CssClass="salon-info-name" Text="Stylio Men&#39;s Salon" />

                        <asp:Panel ID="pnlLocationRow" runat="server" CssClass="salon-meta-item">
                            <asp:Label ID="lblLocationIcon" runat="server" Text="&#128205;" />
                            <asp:Label ID="lblSalonLocation" runat="server" Text="BhaktiNagar, Rajkot" />
                        </asp:Panel>

                        <asp:Panel ID="pnlHoursRow" runat="server" CssClass="salon-meta-item">
                            <asp:Label ID="lblHoursIcon" runat="server" Text="&#128339;" />
                            <asp:Label ID="lblSalonHours" runat="server" Text="Open Today: 08:00 AM - 09:00 PM" />
                        </asp:Panel>
                    </asp:Panel>
                </asp:Panel>

                <!-- Divider -->
                <asp:Panel ID="pnlDivider" runat="server" CssClass="review-card-divider" />

                <!-- Your Rating Section -->
                <asp:Label ID="lblRatingTitle" runat="server" CssClass="rating-section-title" Text="Your Rating" />

                <asp:Panel ID="pnlStarsRow" runat="server" CssClass="stars-rating-row">

                    <!-- Star 1 -->
                    <asp:Panel ID="pnlStar1" runat="server" CssClass="star-rating-item">
                        <asp:LinkButton ID="btnStar1" runat="server" Text="&#9733;" CssClass="star-btn"
                            OnClick="Star_Click" CommandArgument="1" />
                        <asp:Label ID="lblStar1" runat="server" CssClass="star-label" Text="Very Bad" />
                    </asp:Panel>

                    <!-- Star 2 -->
                    <asp:Panel ID="pnlStar2" runat="server" CssClass="star-rating-item">
                        <asp:LinkButton ID="btnStar2" runat="server" Text="&#9733;" CssClass="star-btn"
                            OnClick="Star_Click" CommandArgument="2" />
                        <asp:Label ID="lblStar2" runat="server" CssClass="star-label" Text="Bad" />
                    </asp:Panel>

                    <!-- Star 3 -->
                    <asp:Panel ID="pnlStar3" runat="server" CssClass="star-rating-item">
                        <asp:LinkButton ID="btnStar3" runat="server" Text="&#9733;" CssClass="star-btn"
                            OnClick="Star_Click" CommandArgument="3" />
                        <asp:Label ID="lblStar3" runat="server" CssClass="star-label" Text="Good" />
                    </asp:Panel>

                    <!-- Star 4 -->
                    <asp:Panel ID="pnlStar4" runat="server" CssClass="star-rating-item">
                        <asp:LinkButton ID="btnStar4" runat="server" Text="&#9733;" CssClass="star-btn"
                            OnClick="Star_Click" CommandArgument="4" />
                        <asp:Label ID="lblStar4" runat="server" CssClass="star-label" Text="Very Good" />
                    </asp:Panel>

                    <!-- Star 5 -->
                    <asp:Panel ID="pnlStar5" runat="server" CssClass="star-rating-item">
                        <asp:LinkButton ID="btnStar5" runat="server" Text="&#9733;" CssClass="star-btn"
                            OnClick="Star_Click" CommandArgument="5" />
                        <asp:Label ID="lblStar5" runat="server" CssClass="star-label" Text="Excellent" />
                    </asp:Panel>

                </asp:Panel>

                <!-- Hidden field / label to store rating -->
                <asp:Label ID="lblSelectedRating" runat="server" Text="5" Visible="false" />

                <!-- Your Review Section -->
                <asp:Label ID="lblReviewTextTitle" runat="server" CssClass="review-text-section-title" Text="Your Review" />

                <asp:TextBox ID="txtReviewComment" runat="server" TextMode="MultiLine" Rows="5"
                    CssClass="review-textarea" placeholder="Write your review here...." />

                <!-- Action Button -->
                <asp:Panel ID="pnlActionRow" runat="server" CssClass="review-action-row">
                    <asp:Button ID="btnSubmitReview" runat="server" Text="Submit Review"
                        CssClass="btn-submit-review" OnClick="btnSubmitReview_Click" />
                </asp:Panel>

                <!-- Success Confirmation Message -->
                <asp:Panel ID="pnlReviewSuccess" runat="server" CssClass="review-success-panel" Visible="false">
                    <asp:Label ID="lblSuccessMessage" runat="server" Text="Thank you! Your review has been submitted successfully." />
                </asp:Panel>

            </asp:Panel>

        </asp:Panel>

        <!-- ===================== FOOTER ===================== -->
        <asp:Panel ID="pnlFooter" runat="server" CssClass="footer">

            <asp:Panel ID="pnlFooterColumns" runat="server" CssClass="footer-columns">

                <!-- Brand -->
                <asp:Panel ID="pnlFooterBrandCol" runat="server" CssClass="footer-brand-col">
                    <asp:Panel ID="pnlFooterLogoRow" runat="server" CssClass="footer-logo-row">
                        <asp:Image ID="imgFooterLogo" runat="server"
                            ImageUrl="~/Images/DefaultScreen/footer.png"
                            AlternateText="Stylio" CssClass="logo-img" />
                        <asp:Label ID="lblFooterBrand" runat="server"
                            CssClass="footer-logo-text" Text="Stylio" />
                    </asp:Panel>
                    <asp:Label ID="lblFooterTagline" runat="server" CssClass="footer-tagline"
                        Text="Your Beauty is Our Passion Book Appointments with Top Salon &amp; Professional." />
                </asp:Panel>

                <!-- Quick Links -->
                <asp:Panel ID="pnlFooterQuickLinks" runat="server">
                    <asp:Label ID="lblQuickLinksTitle" runat="server"
                        CssClass="footer-col-title" Text="Quick Links" />
                    <asp:LinkButton ID="lnkFooterHome" runat="server" Text="Home" CssClass="footer-link" OnClick="lnkHome_Click" />
                    <asp:LinkButton ID="lnkFooterServices" runat="server" Text="Services" CssClass="footer-link" OnClick="lnkServices_Click" />
                    <asp:LinkButton ID="lnkFooterSalons" runat="server" Text="Salons" CssClass="footer-link" OnClick="lnkSalon_Click" />
                    <asp:LinkButton ID="lnkFooterAboutUs" runat="server" Text="About us" CssClass="footer-link" OnClick="lnkAboutUs_Click" />
                </asp:Panel>

                <!-- Customer -->
                <asp:Panel ID="pnlFooterCustomer" runat="server">
                    <asp:Label ID="lblCustomerTitle" runat="server"
                        CssClass="footer-col-title" Text="Customer" />
                    <asp:LinkButton ID="lnkFooterMyBooking" runat="server" Text="My Booking" CssClass="footer-link" OnClick="lnkFooterMyBooking_Click" />
                    <asp:LinkButton ID="lnkFooterReviews" runat="server" Text="Reviews" CssClass="footer-link" OnClick="lnkReviews_Click" />
                    <asp:LinkButton ID="lnkFooterContact" runat="server" Text="Contact" CssClass="footer-link" OnClick="lnkAboutUs_Click" />
                </asp:Panel>

                <!-- Support -->
                <asp:Panel ID="pnlFooterSupport" runat="server">
                    <asp:Label ID="lblSupportTitle" runat="server"
                        CssClass="footer-col-title" Text="Support" />
                    <asp:LinkButton ID="lnkFooterHelp" runat="server" Text="Help center" CssClass="footer-link" />
                    <asp:LinkButton ID="lnkFooterTerms" runat="server" Text="Terms &amp; Condition" CssClass="footer-link" />
                    <asp:LinkButton ID="lnkFooterPrivacy" runat="server" Text="Privacy Policy" CssClass="footer-link" />
                    <asp:LinkButton ID="lnkFooterCancellation" runat="server" Text="Cancellation Policy" CssClass="footer-link" />
                </asp:Panel>

                <!-- Follow Us -->
                <asp:Panel ID="pnlFooterSocial" runat="server">
                    <asp:Label ID="lblFollowUsTitle" runat="server"
                        CssClass="footer-col-title" Text="Follow Us" />
                    <asp:Panel ID="pnlSocialRow" runat="server" CssClass="footer-social-row">
                        <asp:HyperLink ID="hlFacebook" runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="f" />
                        <asp:HyperLink ID="hlInstagram" runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="ig" />
                        <asp:HyperLink ID="hlTwitter" runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="x" />
                    </asp:Panel>
                </asp:Panel>

            </asp:Panel>

            <asp:Panel ID="pnlFooterBottom" runat="server" CssClass="footer-bottom">
                <asp:Label ID="lblCopyright" runat="server"
                    Text="&#169; 2026 Stylio Salon. All Right Reserved." />
            </asp:Panel>

        </asp:Panel>

    </form>
</body>
</html>
