<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="guest.aspx.cs" Inherits="Stylio_Salon.guest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stylio - Find. Compare. Book.</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <!-- ===================== HEADER ===================== -->
            <asp:Panel ID="pnlHeader" runat="server" CssClass="header">

                <asp:Panel ID="pnlLogoArea" runat="server" CssClass="logo-area">
                    <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/guestscreen/Stylio_logo.png"
                         CssClass="logo-img" Height="81px" Width="150px" />
                    <asp:Label ID="lblBrandName" runat="server" Text="Stylio" CssClass="logo-text" />
                </asp:Panel>

                <asp:Panel ID="pnlNav" runat="server" CssClass="nav-links">
                    <asp:LinkButton ID="lnkHome" runat="server" Text="Home" CssClass="nav-link nav-link-active"
                        OnClick="lnkHome_Click" />
                    <asp:LinkButton ID="lnkServices" runat="server" Text="Services" CssClass="nav-link"
                        OnClick="lnkServices_Click" />
                    <asp:LinkButton ID="lnkSalon" runat="server" Text="Salon" CssClass="nav-link"
                        OnClick="lnkSalon_Click" />
                    <asp:LinkButton ID="lnkReviews" runat="server" Text="Reviews" CssClass="nav-link"
                        OnClick="lnkReviews_Click" />
                    <asp:LinkButton ID="lnkAboutUs" runat="server" Text="About Us" CssClass="nav-link"
                        OnClick="lnkAboutUs_Click" />
                </asp:Panel>

                <asp:Panel ID="pnlUserArea" runat="server" CssClass="guest-user-area">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-nav-login"
                        OnClick="btnLogin_Click" />
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-nav-register"
                        OnClick="btnRegister_Click" />
                </asp:Panel>

            </asp:Panel>

            <!-- ===================== HERO (full-bleed brand image) ===================== -->
            <asp:Panel ID="pnlHeroWrapper" runat="server" CssClass="hero-wrapper">

                <asp:Image ID="imgHero" runat="server" ImageUrl="~/Images/guestscreen/Rectangle 7.png"
                    AlternateText="Stylio - Find. Compare. Book." CssClass="hero-full-image" />

                <!-- ===================== SEARCH CARD ===================== -->
                <asp:Panel ID="pnlSearchCardWrapper" runat="server" CssClass="search-card-wrapper">
                    <asp:Panel ID="pnlSearchCard" runat="server" CssClass="search-card">

                        <asp:Label ID="lblSearchTitle" runat="server" CssClass="search-title"
                            Text="Find Your Perfect Salon" />

                        <asp:Panel ID="pnlSearchFields" runat="server" CssClass="search-fields">

                            <asp:Panel ID="pnlLocationField" runat="server" CssClass="field-group">
                                <asp:Label ID="lblLocation" runat="server" CssClass="field-label" Text="Location" />
                                <asp:DropDownList ID="ddlLocation" runat="server" CssClass="field-dropdown">
                                    <asp:ListItem Text="Select Location" Value="" />
                                    <asp:ListItem Text="BhaktiNagar, Rajkot" Value="bhaktinagar" />
                                    <asp:ListItem Text="Trikon Bag, Rajkot" Value="trikonbag" />
                                    <asp:ListItem Text="Gondal Chowkdi, Rajkot" Value="gondalchowkdi" />
                                </asp:DropDownList>
                            </asp:Panel>

                            <asp:Panel ID="pnlServiceField" runat="server" CssClass="field-group">
                                <asp:Label ID="lblServiceField" runat="server" CssClass="field-label" Text="Service" />
                                <asp:DropDownList ID="ddlService" runat="server" CssClass="field-dropdown">
                                    <asp:ListItem Text="Select Service" Value="" />
                                    <asp:ListItem Text="Hair Cut" Value="haircut" />
                                    <asp:ListItem Text="Beard" Value="beard" />
                                    <asp:ListItem Text="Hair Color" Value="haircolor" />
                                    <asp:ListItem Text="Facial" Value="facial" />
                                </asp:DropDownList>
                            </asp:Panel>

                            <asp:Panel ID="pnlDateField" runat="server" CssClass="field-group">
                                <asp:Label ID="lblDateField" runat="server" CssClass="field-label" Text="Date" />
                                <asp:DropDownList ID="ddlDate" runat="server" CssClass="field-dropdown">
                                    <asp:ListItem Text="Select Date" Value="" />
                                    <asp:ListItem Text="Today" Value="today" />
                                    <asp:ListItem Text="Tomorrow" Value="tomorrow" />
                                    <asp:ListItem Text="This Weekend" Value="weekend" />
                                </asp:DropDownList>
                            </asp:Panel>

                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-search"
                                OnClick="btnSearch_Click" />

                        </asp:Panel>

                    </asp:Panel>
                </asp:Panel>

            </asp:Panel>

            <!-- ===================== POPULAR SALONS ===================== -->
            <asp:Panel ID="pnlSalonsSection" runat="server" CssClass="section-wrapper">

                <asp:Panel ID="pnlSalonsHeaderRow" runat="server" CssClass="section-header-row">
                    <asp:Label ID="lblSalonsTitle" runat="server" CssClass="section-title" Text="Popular Salons" />
                </asp:Panel>

                <asp:Panel ID="pnlSalonGrid" runat="server" CssClass="salon-grid">
                    <asp:Repeater ID="rptSalons" runat="server" OnItemCommand="rptSalons_ItemCommand">
                        <ItemTemplate>
                            <asp:Panel ID="pnlSalonCard" runat="server" CssClass="salon-card">
                                <asp:Image ID="imgSalon" runat="server"
                                    ImageUrl='<%# Eval("ImageUrl") %>'
                                    AlternateText='<%# Eval("Name") %>'
                                    CssClass="salon-card-img" />
                                <asp:Panel ID="pnlSalonCardBody" runat="server" CssClass="salon-card-body">
                                    <asp:Label ID="lblSalonName" runat="server" CssClass="salon-name"
                                        Text='<%# Eval("Name") %>' />
                                    <asp:Label ID="lblSalonRating" runat="server" CssClass="salon-rating"
                                        Text='<%# Eval("RatingDisplay") %>' />
                                    <asp:Panel ID="pnlSalonMetaRow" runat="server" CssClass="salon-meta-row">
                                        <asp:Label ID="lblSalonLocation" runat="server" CssClass="salon-location"
                                            Text='<%# Eval("LocationDisplay") %>' />
                                        <asp:LinkButton ID="lnkViewDetails" runat="server" Text="View Details"
                                            CssClass="btn-view-details" CommandName="ViewDetails"
                                            CommandArgument='<%# Eval("Id") %>' />
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>

            </asp:Panel>

            <!-- ===================== OUR SERVICES ===================== -->
            <asp:Panel ID="pnlServicesSection" runat="server" CssClass="section-wrapper">

                <asp:Panel ID="pnlServicesHeaderRow" runat="server" CssClass="section-header-row">
                    <asp:Label ID="lblServicesTitle" runat="server" CssClass="section-title" Text="Our Services" />
                    <asp:LinkButton ID="lnkServicesViewAll" runat="server" Text="View All"
                        CssClass="view-all-link" OnClick="lnkServicesViewAll_Click" />
                </asp:Panel>

                <asp:Panel ID="pnlServiceGrid" runat="server" CssClass="service-grid">
                    <asp:Repeater ID="rptServices" runat="server">
                        <ItemTemplate>
                            <asp:Panel ID="pnlServiceCard" runat="server" CssClass="service-card">
                                <asp:Image ID="imgServiceIcon" runat="server"
                                    ImageUrl='<%# Eval("IconUrl") %>'
                                    AlternateText='<%# Eval("Name") %>'
                                    CssClass="service-icon-circle" />
                                <asp:Label ID="lblServiceName" runat="server" CssClass="service-name"
                                    Text='<%# Eval("Name") %>' />
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>

            </asp:Panel>

            <!-- ===================== CUSTOMER REVIEWS ===================== -->
            <asp:Panel ID="pnlReviewsSection" runat="server" CssClass="section-wrapper">

                <asp:Panel ID="pnlReviewsHeaderRow" runat="server" CssClass="section-header-row">
                    <asp:Label ID="lblReviewsTitle" runat="server" CssClass="section-title" Text="Customer Reviews" />
                    <asp:LinkButton ID="lnkReviewsViewAll" runat="server" Text="View All"
                        CssClass="view-all-link" OnClick="lnkReviewsViewAll_Click" />
                </asp:Panel>

                <asp:Panel ID="pnlReviewRow" runat="server" CssClass="review-row">

                    <asp:LinkButton ID="lnkReviewPrev" runat="server" Text="&#10094;"
                        CssClass="review-arrow-btn" OnClick="lnkReviewPrev_Click" />

                    <asp:Panel ID="pnlReviewGrid" runat="server" CssClass="review-grid">
                        <asp:Repeater ID="rptReviews" runat="server">
                            <ItemTemplate>
                                <asp:Panel ID="pnlReviewCard" runat="server" CssClass="review-card">
                                    <asp:Panel ID="pnlReviewHeader" runat="server" CssClass="review-header">
                                        <asp:Image ID="imgReviewer" runat="server"
                                            ImageUrl='<%# Eval("AvatarUrl") %>'
                                            AlternateText='<%# Eval("Name") %>'
                                            CssClass="review-avatar" />
                                        <asp:Panel ID="pnlReviewNameStars" runat="server">
                                            <asp:Label ID="lblReviewerName" runat="server" CssClass="review-name"
                                                Text='<%# Eval("Name") %>' />
                                            <asp:Label ID="lblReviewStars" runat="server" CssClass="review-stars"
                                                Text="&#9733;&#9733;&#9733;&#9733;&#9733;" />
                                        </asp:Panel>
                                    </asp:Panel>
                                    <asp:Label ID="lblReviewText" runat="server" CssClass="review-text"
                                        Text='<%# Eval("Comment") %>' />
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:Panel>

                    <asp:LinkButton ID="lnkReviewNext" runat="server" Text="&#10095;"
                        CssClass="review-arrow-btn" OnClick="lnkReviewNext_Click" />

                </asp:Panel>

            </asp:Panel>

            <!-- ===================== FOOTER ===================== -->
            <asp:Panel ID="pnlFooter" runat="server" CssClass="footer">

                <asp:Panel ID="pnlFooterColumns" runat="server" CssClass="footer-columns">

                    <asp:Panel ID="pnlFooterBrandCol" runat="server" CssClass="footer-brand-col">
                        <asp:Panel ID="pnlFooterLogoRow" runat="server" CssClass="footer-logo-row">
                            <asp:Image ID="imgFooterLogo" runat="server" ImageUrl="~/Images/logo.png"
                                AlternateText="Stylio" CssClass="logo-img" />
                            <asp:Label ID="lblFooterBrand" runat="server" CssClass="footer-logo-text" Text="Stylio" />
                        </asp:Panel>
                        <asp:Label ID="lblFooterTagline" runat="server" CssClass="footer-tagline"
                            Text="Your Beauty is Our Passion. Book Appointments with Top Salon &amp; Professional." />
                    </asp:Panel>

                    <asp:Panel ID="pnlFooterQuickLinks" runat="server">
                        <asp:Label ID="lblQuickLinksTitle" runat="server" CssClass="footer-col-title" Text="Quick Links" />
                        <asp:LinkButton ID="lnkFooterHome" runat="server" Text="Home" CssClass="footer-link"
                            OnClick="lnkHome_Click" />
                        <asp:LinkButton ID="lnkFooterServices" runat="server" Text="Services" CssClass="footer-link"
                            OnClick="lnkServices_Click" />
                        <asp:LinkButton ID="lnkFooterSalons" runat="server" Text="Salons" CssClass="footer-link"
                            OnClick="lnkSalon_Click" />
                        <asp:LinkButton ID="lnkFooterAboutUs" runat="server" Text="About us" CssClass="footer-link"
                            OnClick="lnkAboutUs_Click" />
                    </asp:Panel>

                    <asp:Panel ID="pnlFooterCustomer" runat="server">
                        <asp:Label ID="lblCustomerTitle" runat="server" CssClass="footer-col-title" Text="Customer" />
                        <asp:LinkButton ID="lnkFooterLogin" runat="server" Text="Login" CssClass="footer-link"
                            OnClick="btnLogin_Click" />
                        <asp:LinkButton ID="lnkFooterRegister" runat="server" Text="Register" CssClass="footer-link"
                            OnClick="btnRegister_Click" />
                        <asp:LinkButton ID="lnkFooterMyBooking" runat="server" Text="My Booking" CssClass="footer-link" />
                        <asp:LinkButton ID="lnkFooterReviews" runat="server" Text="Reviews" CssClass="footer-link" />
                        <asp:LinkButton ID="lnkFooterContact" runat="server" Text="Contact" CssClass="footer-link" />
                    </asp:Panel>

                    <asp:Panel ID="pnlFooterSupport" runat="server">
                        <asp:Label ID="lblSupportTitle" runat="server" CssClass="footer-col-title" Text="Support" />
                        <asp:LinkButton ID="lnkFooterHelpCenter" runat="server" Text="Help center" CssClass="footer-link" />
                        <asp:LinkButton ID="lnkFooterTerms" runat="server" Text="Terms &amp; Condition" CssClass="footer-link" />
                        <asp:LinkButton ID="lnkFooterPrivacy" runat="server" Text="Privacy Policy" CssClass="footer-link" />
                        <asp:LinkButton ID="lnkFooterCancellation" runat="server" Text="Cancellation Policy" CssClass="footer-link" />
                    </asp:Panel>

                    <asp:Panel ID="pnlFooterSocial" runat="server">
                        <asp:Label ID="lblFollowUsTitle" runat="server" CssClass="footer-col-title" Text="Follow Us" />
                        <asp:Panel ID="pnlSocialRow" runat="server" CssClass="footer-social-row">
                            <asp:HyperLink ID="hlFacebook" runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="f" />
                            <asp:HyperLink ID="hlInstagram" runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="ig" />
                            <asp:HyperLink ID="hlTwitter" runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="x" />
                        </asp:Panel>
                    </asp:Panel>

                </asp:Panel>

                <asp:Panel ID="pnlFooterBottom" runat="server" CssClass="footer-bottom">
                    <asp:Label ID="lblCopyright" runat="server" Text="&#169; 2026 Stylio Salon. All Right Reserved." />
                </asp:Panel>

            </asp:Panel>

        </div>
    </form>
</body>
</html>
