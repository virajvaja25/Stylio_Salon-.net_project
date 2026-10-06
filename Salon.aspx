<%@ Page Title="Stylio | Salons" Language="C#" AutoEventWireup="true" CodeBehind="Salon.aspx.cs" Inherits="Stylio_Salon.Salons" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Salons</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
</head>
<body>
    <form id="frmSalons" runat="server">

        <!-- ===================== HEADER ===================== -->
        <asp:Panel ID="pnlHeader" runat="server" CssClass="header header-simple">

            <asp:Panel ID="pnlLogoArea" runat="server" CssClass="logo-area">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/SalonScreen/logo.png"
                    AlternateText="Stylio Logo" CssClass="logo-img" />
            </asp:Panel>

            <asp:Panel ID="pnlNav" runat="server" CssClass="nav-links-wide">
                <asp:LinkButton ID="lnkHome" runat="server" Text="Home" CssClass="nav-link"
                    OnClick="lnkHome_Click" />
                <asp:LinkButton ID="lnkSalon" runat="server" Text="Salon" CssClass="nav-link nav-link-active"
                    OnClick="lnkSalon_Click" />
                <asp:LinkButton ID="lnkReviews" runat="server" Text="Reviews" CssClass="nav-link"
                    OnClick="lnkReviews_Click" />
                <asp:LinkButton ID="lnkAboutUs" runat="server" Text="About Us" CssClass="nav-link"
                    OnClick="lnkAboutUs_Click" />
            </asp:Panel>

        </asp:Panel>

        <!-- ===================== PAGE TITLE ===================== -->
        <asp:Panel ID="pnlSalonsPageHeader" runat="server" CssClass="salons-page-header">
            <asp:Label ID="lblPageTitle" runat="server" CssClass="salons-page-title" Text="Salons" />
        </asp:Panel>

        <!-- ===================== BODY (FILTER + LIST) ===================== -->
        <asp:Panel ID="pnlSalonsBodyWrapper" runat="server" CssClass="salons-body-wrapper">

            <!-- ---------------- FILTER SIDEBAR ---------------- -->
            <asp:Panel ID="pnlFilterSidebar" runat="server" CssClass="filter-sidebar">

                <asp:Button ID="btnFilterHeader" runat="server" Text="Filter" CssClass="btn-filter-header" />

                <asp:Panel ID="pnlLocationFilter" runat="server" CssClass="filter-group">
                    <asp:Label ID="lblLocationFilter" runat="server" CssClass="filter-label" Text="Location" />
                    <asp:DropDownList ID="ddlFilterLocation" runat="server" CssClass="filter-dropdown">
                        <asp:ListItem Text="Select Location" Value="" />
                        <asp:ListItem Text="Trikon Bag, Rajkot" Value="trikonbag" />
                        <asp:ListItem Text="Bhaktinagar Circle, Rajkot" Value="bhaktinagar" />
                        <asp:ListItem Text="Surat, Gujrat" Value="surat" />
                    </asp:DropDownList>
                </asp:Panel>

                <asp:Panel ID="pnlServicesFilter" runat="server" CssClass="filter-group">
                    <asp:Label ID="lblServicesFilter" runat="server" CssClass="filter-label" Text="Services" />
                    <asp:DropDownList ID="ddlFilterService" runat="server" CssClass="filter-dropdown">
                        <asp:ListItem Text="Select Service" Value="" />
                        <asp:ListItem Text="Hair Cut" Value="haircut" />
                        <asp:ListItem Text="Beard" Value="beard" />
                        <asp:ListItem Text="Hair Color" Value="haircolor" />
                        <asp:ListItem Text="Hair Spa" Value="hairspa" />
                        <asp:ListItem Text="Facial" Value="facial" />
                    </asp:DropDownList>
                </asp:Panel>

                <asp:Panel ID="pnlRatingFilter" runat="server" CssClass="filter-group">
                    <asp:Label ID="lblRatingFilter" runat="server" CssClass="filter-label" Text="Min Rating" />
                    <asp:DropDownList ID="ddlFilterRating" runat="server" CssClass="filter-dropdown">
                        <asp:ListItem Text="Select Rating" Value="" />
                        <asp:ListItem Text="4.5 &amp; above" Value="4.5" />
                        <asp:ListItem Text="4.0 &amp; above" Value="4.0" />
                        <asp:ListItem Text="3.5 &amp; above" Value="3.5" />
                    </asp:DropDownList>
                </asp:Panel>

                <asp:Panel ID="pnlPriceFilter" runat="server" CssClass="filter-group">
                    <asp:Label ID="lblPriceFilter" runat="server" CssClass="filter-label" Text="Price Range" />
                    <asp:DropDownList ID="ddlFilterPrice" runat="server" CssClass="filter-dropdown">
                        <asp:ListItem Text="Any Price" Value="" />
                        <asp:ListItem Text="Under &#8377;500" Value="under500" />
                        <asp:ListItem Text="&#8377;500 - &#8377;1000" Value="500to1000" />
                        <asp:ListItem Text="&#8377;1000+" Value="above1000" />
                    </asp:DropDownList>
                </asp:Panel>

                <asp:Panel ID="pnlFilterActions" runat="server" CssClass="filter-actions-row">
                    <asp:Button ID="btnFilterReset" runat="server" Text="RESET" CssClass="btn-filter-reset"
                        OnClick="btnFilterReset_Click" CausesValidation="false" />
                    <asp:Button ID="btnFilterApply" runat="server" Text="APPLY" CssClass="btn-filter-apply"
                        OnClick="btnFilterApply_Click" />
                </asp:Panel>

            </asp:Panel>

            <!-- ---------------- SALON LIST ---------------- -->
            <asp:Panel ID="pnlSalonsListContent" runat="server" CssClass="salons-list-content">

                <asp:Panel ID="pnlSearchBox" runat="server" CssClass="salon-search-box">
                    <asp:Label ID="lblSearchIcon" runat="server" CssClass="salon-search-icon" Text="&#128269;" />
                    <asp:TextBox ID="txtSearchSalon" runat="server" CssClass="salon-search-input"
                        placeholder="Search Salon And Services" />
                </asp:Panel>

                <asp:Repeater ID="rptSalonList" runat="server" OnItemCommand="rptSalonList_ItemCommand">
                    <ItemTemplate>
                        <asp:Panel ID="pnlSalonListCard" runat="server" CssClass="salon-list-card">

                            <asp:Image ID="imgSalonList" runat="server"
                                ImageUrl='<%# Eval("ImageUrl") %>'
                                AlternateText='<%# Eval("Name") %>'
                                CssClass="salon-list-img" />

                            <asp:Panel ID="pnlSalonListBody" runat="server" CssClass="salon-list-body">

                                <asp:Panel ID="pnlSalonListHeaderRow" runat="server" CssClass="salon-list-header-row">
                                    <asp:Label ID="lblSalonListName" runat="server" CssClass="salon-list-name"
                                        Text='<%# Eval("Name") %>' />
                                    <asp:Panel ID="pnlSalonListRating" runat="server" CssClass="salon-list-rating">
                                        <asp:Label ID="lblStarIcon" runat="server" CssClass="star" Text="&#9733;" />
                                        <asp:Label ID="lblSalonListRating" runat="server"
                                            Text='<%# Eval("Rating") %>' />
                                    </asp:Panel>
                                </asp:Panel>

                                <asp:Panel ID="pnlSalonListMetaRow" runat="server" CssClass="salon-list-meta-row">
                                    <asp:Label ID="lblLocationIcon" runat="server" Text="&#128205;" />
                                    <asp:Label ID="lblSalonListLocation" runat="server"
                                        Text='<%# Eval("Location") %>' />
                                </asp:Panel>

                                <asp:Panel ID="pnlSalonListServicesRow" runat="server" CssClass="salon-list-services-row">
                                    <asp:Label ID="lblServicesIcon" runat="server" Text="&#9986;" />
                                    <asp:Label ID="lblSalonListServices" runat="server"
                                        Text='<%# Eval("ServicesText") %>' />
                                </asp:Panel>

                                <asp:LinkButton ID="lnkSalonListViewDetails" runat="server" Text="View Details"
                                    CssClass="btn-view-details-lg" CommandName="ViewDetails"
                                    CommandArgument='<%# Eval("Id") %>' />

                            </asp:Panel>

                        </asp:Panel>
                    </ItemTemplate>
                </asp:Repeater>

            </asp:Panel>

        </asp:Panel>

        <!-- ===================== FOOTER ===================== -->
        <asp:Panel ID="pnlFooter" runat="server" CssClass="footer">

            <asp:Panel ID="pnlFooterColumns" runat="server" CssClass="footer-columns">

                <asp:Panel ID="pnlFooterBrandCol" runat="server" CssClass="footer-brand-col">
                    <asp:Panel ID="pnlFooterLogoRow" runat="server" CssClass="footer-logo-row">
                        <asp:Image ID="imgFooterLogo" runat="server" ImageUrl="~/Images/SalonScreen/footer.png"
                            AlternateText="Stylio" CssClass="logo-img" />
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
                    <asp:LinkButton ID="lnkFooterMyBooking" runat="server" Text="My Booking" CssClass="footer-link" />
                    <asp:LinkButton ID="lnkFooterReviews" runat="server" Text="Reviews" CssClass="footer-link"
                        OnClick="lnkReviews_Click" />
                    <asp:LinkButton ID="lnkFooterContact" runat="server" Text="Contact" CssClass="footer-link" />
                </asp:Panel>

                <asp:Panel ID="pnlFooterSupport" runat="server">
                    <asp:Label ID="lblSupportTitle" runat="server" CssClass="footer-col-title" Text="Support" />
                    <asp:LinkButton ID="lnkFooterHelpCenter" runat="server" Text="Help center" CssClass="footer-link" />
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

    </form>
</body>
</html>
