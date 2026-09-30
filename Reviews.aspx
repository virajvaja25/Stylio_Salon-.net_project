<%@ Page Title="Stylio | Customer Reviews" Language="C#" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="Stylio_Salon.ReviewsPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Customer Reviews</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
    <style>
        .reviews-banner {
            background-color: #E7D6BE;
            padding: 48px 60px;
            text-align: center;
        }
        .reviews-page-wrapper {
            max-width: 1200px;
            margin: 0 auto;
            padding: 50px 40px 80px;
            display: grid;
            grid-template-columns: 1fr 360px;
            gap: 40px;
            align-items: flex-start;
        }
        .reviews-feed-title {
            font-size: 26px;
            font-weight: bold;
            color: #241608;
            margin-bottom: 24px;
        }
        .write-review-card {
            background-color: #FFFFFF;
            border-radius: 14px;
            padding: 28px 24px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.06);
        }
        .write-review-title {
            font-size: 22px;
            font-weight: bold;
            color: #241608;
            margin-bottom: 8px;
            display: block;
        }
        .write-review-sub {
            font-size: 14px;
            color: #6b5847;
            margin-bottom: 20px;
            display: block;
        }
        .review-card-full {
            background-color: #FFFFFF;
            border-radius: 12px;
            padding: 24px;
            margin-bottom: 20px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.04);
        }
        .review-card-top {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-bottom: 12px;
        }
        .review-avatar-lg {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            object-fit: cover;
        }
        .review-author {
            font-size: 17px;
            font-weight: bold;
            color: #241608;
        }
        .review-stars-gold {
            color: #E3A72A;
            font-size: 16px;
        }
        .review-comment-full {
            font-size: 15px;
            color: #4a3a2a;
            line-height: 1.6;
        }
        .review-success-msg {
            background-color: #EBF7EE;
            border: 1px solid #3FA34D;
            color: #267A32;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 16px;
            font-size: 14px;
            text-align: center;
        }
        @media (max-width: 860px) {
            .reviews-page-wrapper {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="frmReviews" runat="server">

        <!-- ===================== HEADER ===================== -->
        <asp:Panel ID="pnlHeader" runat="server" CssClass="header">
            <asp:Panel ID="pnlLogoArea" runat="server" CssClass="logo-area">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/DefaultScreen/logo.png"
                    AlternateText="Stylio" CssClass="logo-img" />
                <asp:Label ID="lblBrandName" runat="server" CssClass="logo-text" />
            </asp:Panel>

            <asp:Panel ID="pnlNav" runat="server" CssClass="nav-links">
                <asp:LinkButton ID="lnkHome" runat="server" Text="Home" CssClass="nav-link" OnClick="lnkHome_Click" />
                <asp:LinkButton ID="lnkSalon" runat="server" Text="Salon" CssClass="nav-link" OnClick="lnkSalon_Click" />
                <asp:LinkButton ID="lnkServices" runat="server" Text="Services" CssClass="nav-link" OnClick="lnkServices_Click" />
                <asp:LinkButton ID="lnkReviews" runat="server" Text="Reviews" CssClass="nav-link nav-link-active" OnClick="lnkReviews_Click" />
                <asp:LinkButton ID="lnkAboutUs" runat="server" Text="About Us" CssClass="nav-link" OnClick="lnkAboutUs_Click" />
            </asp:Panel>

            <asp:Panel ID="pnlUserArea" runat="server" CssClass="guest-user-area">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-nav-login" OnClick="btnLogin_Click" />
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-nav-register" OnClick="btnRegister_Click" />
            </asp:Panel>
        </asp:Panel>

        <!-- ===================== BANNER ===================== -->
        <asp:Panel ID="pnlBanner" runat="server" CssClass="reviews-banner">
            <asp:Label ID="lblReviewTitle" runat="server" CssClass="salons-page-title" Text="Customer Reviews" />
            <br />
            <asp:Label ID="lblReviewSub" runat="server" CssClass="services-subtitle"
                Text="Read trusted feedback from people who booked through Stylio, or leave your own review below." />
        </asp:Panel>

        <!-- ===================== CONTENT ===================== -->
        <div class="reviews-page-wrapper">

            <!-- Feed Column -->
            <div>
                <div class="reviews-feed-title">Latest Customer Experiences</div>
                <asp:Repeater ID="rptReviewsList" runat="server">
                    <ItemTemplate>
                        <div class="review-card-full">
                            <div class="review-card-top">
                                <asp:Image ID="imgAvatar" runat="server" ImageUrl='<%# Eval("AvatarUrl") %>'
                                    AlternateText='<%# Eval("Name") %>' CssClass="review-avatar-lg" />
                                <div>
                                    <div class="review-author"><%# Eval("Name") %></div>
                                    <div class="review-stars-gold">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                                </div>
                            </div>
                            <div class="review-comment-full"><%# Eval("Comment") %></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Write Review Sidebar -->
            <div class="write-review-card">
                <span class="write-review-title">Leave a Review</span>
                <span class="write-review-sub">Share your feedback to help others find the best salon experience.</span>

                <asp:Panel ID="pnlReviewSuccess" runat="server" CssClass="review-success-msg" Visible="false">
                    &#10004; Thank you! Your review has been added.
                </asp:Panel>

                <div class="form-group">
                    <asp:Label ID="lblReviewSalon" runat="server" AssociatedControlID="ddlReviewSalon"
                        CssClass="form-label" Text="Salon Visited" />
                    <asp:DropDownList ID="ddlReviewSalon" runat="server" CssClass="form-input">
                        <asp:ListItem Text="Stylio Men's Salon - Trikon Bag" Value="1" />
                        <asp:ListItem Text="The Mae Mane Salon - Bhaktinagar" Value="2" />
                        <asp:ListItem Text="The Hair Studio - Surat" Value="3" />
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblReviewerName" runat="server" AssociatedControlID="txtReviewerName"
                        CssClass="form-label" Text="Your Name" />
                    <asp:TextBox ID="txtReviewerName" runat="server" CssClass="form-input" placeholder="Your name" />
                    <asp:RequiredFieldValidator ID="rfvReviewerName" runat="server" ControlToValidate="txtReviewerName"
                        CssClass="field-error" ErrorMessage="Name is required." Display="Dynamic" EnableClientScript="false" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblReviewRating" runat="server" AssociatedControlID="ddlReviewRating"
                        CssClass="form-label" Text="Rating" />
                    <asp:DropDownList ID="ddlReviewRating" runat="server" CssClass="form-input">
                        <asp:ListItem Text="&#9733;&#9733;&#9733;&#9733;&#9733; - Excellent (5/5)" Value="5" />
                        <asp:ListItem Text="&#9733;&#9733;&#9733;&#9733;&#9734; - Very Good (4/5)" Value="4" />
                        <asp:ListItem Text="&#9733;&#9733;&#9733;&#9734;&#9734; - Average (3/5)" Value="3" />
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblReviewComment" runat="server" AssociatedControlID="txtReviewComment"
                        CssClass="form-label" Text="Your Review" />
                    <asp:TextBox ID="txtReviewComment" runat="server" CssClass="form-input" TextMode="MultiLine"
                        Rows="4" placeholder="How was the styling, staff, and hygiene?" />
                    <asp:RequiredFieldValidator ID="rfvReviewComment" runat="server" ControlToValidate="txtReviewComment"
                        CssClass="field-error" ErrorMessage="Review comment is required." Display="Dynamic" EnableClientScript="false" />
                </div>

                <asp:Button ID="btnSubmitReview" runat="server" Text="Post Review" CssClass="btn-primary-wide"
                    OnClick="btnSubmitReview_Click" />
            </div>

        </div>

        <!-- ===================== FOOTER ===================== -->
        <asp:Panel ID="pnlFooter" runat="server" CssClass="footer">
            <asp:Panel ID="pnlFooterColumns" runat="server" CssClass="footer-columns">
                <asp:Panel ID="pnlFooterBrandCol" runat="server" CssClass="footer-brand-col">
                    <asp:Panel ID="pnlFooterLogoRow" runat="server" CssClass="footer-logo-row">
                        <asp:Image ID="imgFooterLogo" runat="server" ImageUrl="~/Images/DefaultScreen/logo.png"
                            AlternateText="Stylio" CssClass="logo-img" />
                        <asp:Label ID="lblFooterBrand" runat="server" CssClass="footer-logo-text" Text="Stylio" />
                    </asp:Panel>
                    <asp:Label ID="lblFooterTagline" runat="server" CssClass="footer-tagline"
                        Text="Your Beauty is Our Passion. Book Appointments with Top Salon &amp; Professional." />
                </asp:Panel>

                <asp:Panel ID="pnlFooterQuickLinks" runat="server">
                    <asp:Label ID="lblQuickLinksTitle" runat="server" CssClass="footer-col-title" Text="Quick Links" />
                    <asp:LinkButton ID="lnkFooterHome" runat="server" Text="Home" CssClass="footer-link" OnClick="lnkHome_Click" />
                    <asp:LinkButton ID="lnkFooterServices" runat="server" Text="Services" CssClass="footer-link" OnClick="lnkServices_Click" />
                    <asp:LinkButton ID="lnkFooterSalons" runat="server" Text="Salons" CssClass="footer-link" OnClick="lnkSalon_Click" />
                    <asp:LinkButton ID="lnkFooterAboutUs" runat="server" Text="About us" CssClass="footer-link" OnClick="lnkAboutUs_Click" />
                </asp:Panel>

                <asp:Panel ID="pnlFooterCustomer" runat="server">
                    <asp:Label ID="lblCustomerTitle" runat="server" CssClass="footer-col-title" Text="Customer" />
                    <asp:LinkButton ID="lnkFooterLogin" runat="server" Text="Login" CssClass="footer-link" OnClick="btnLogin_Click" />
                    <asp:LinkButton ID="lnkFooterRegister" runat="server" Text="Register" CssClass="footer-link" OnClick="btnRegister_Click" />
                    <asp:LinkButton ID="lnkFooterReviews" runat="server" Text="Reviews" CssClass="footer-link" OnClick="lnkReviews_Click" />
                </asp:Panel>

                <asp:Panel ID="pnlFooterSupport" runat="server">
                    <asp:Label ID="lblSupportTitle" runat="server" CssClass="footer-col-title" Text="Support" />
                    <asp:Label runat="server" CssClass="footer-tagline" Text="Contact: support@styliosalon.com" />
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="pnlFooterBottom" runat="server" CssClass="footer-bottom">
                <asp:Label ID="lblCopyright" runat="server" Text="&#169; 2026 Stylio Salon. All Right Reserved." />
            </asp:Panel>
        </asp:Panel>

    </form>
</body>
</html>
