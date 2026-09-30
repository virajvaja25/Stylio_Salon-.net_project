<%@ Page Title="Stylio | Search Results" Language="C#" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" Inherits="Stylio_Salon.SearchResults" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Search Results</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
    <style>
        .search-results-header {
            background-color: #E7D6BE;
            padding: 40px 60px;
        }
        .search-criteria-badge {
            display: inline-block;
            background-color: #FFFFFF;
            border-radius: 20px;
            padding: 6px 16px;
            font-size: 14px;
            color: #3B2415;
            margin-right: 10px;
            margin-top: 10px;
            font-weight: 600;
        }
        .results-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 60px 80px;
        }
        .no-results-box {
            background-color: #FFFFFF;
            border-radius: 12px;
            padding: 50px 30px;
            text-align: center;
            box-shadow: 0 4px 16px rgba(0,0,0,0.06);
        }
        .no-results-icon {
            font-size: 48px;
            margin-bottom: 16px;
        }
        .no-results-title {
            font-size: 24px;
            font-weight: bold;
            color: #241608;
            margin-bottom: 10px;
        }
        .no-results-desc {
            font-size: 16px;
            color: #6b5847;
            margin-bottom: 24px;
        }
    </style>
</head>
<body>
    <form id="frmSearchResults" runat="server">

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
                <asp:LinkButton ID="lnkReviews" runat="server" Text="Reviews" CssClass="nav-link" OnClick="lnkReviews_Click" />
                <asp:LinkButton ID="lnkAboutUs" runat="server" Text="About Us" CssClass="nav-link" OnClick="lnkAboutUs_Click" />
            </asp:Panel>

            <asp:Panel ID="pnlUserArea" runat="server" CssClass="guest-user-area">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-nav-login" OnClick="btnLogin_Click" />
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-nav-register" OnClick="btnRegister_Click" />
            </asp:Panel>
        </asp:Panel>

        <!-- ===================== HEADER BANNER ===================== -->
        <asp:Panel ID="pnlBanner" runat="server" CssClass="search-results-header">
            <asp:Label ID="lblResultsTitle" runat="server" CssClass="salons-page-title" Text="Search Results" />
            <br />
            <asp:Panel ID="pnlBadges" runat="server">
                <asp:Label ID="lblLocationBadge" runat="server" CssClass="search-criteria-badge" />
                <asp:Label ID="lblServiceBadge" runat="server" CssClass="search-criteria-badge" />
                <asp:Label ID="lblDateBadge" runat="server" CssClass="search-criteria-badge" />
            </asp:Panel>
        </asp:Panel>

        <!-- ===================== RESULTS CONTAINER ===================== -->
        <div class="results-container">

            <asp:Panel ID="pnlNoResults" runat="server" CssClass="no-results-box" Visible="false">
                <div class="no-results-icon">&#128269;</div>
                <div class="no-results-title">No Salons Matched Your Criteria</div>
                <div class="no-results-desc">Try clearing your filters or exploring all available partner salons.</div>
                <asp:HyperLink ID="hlAllSalons" runat="server" NavigateUrl="Salon.aspx"
                    CssClass="btn-primary-wide" Text="Browse All Salons" Style="display: inline-block; width: auto; padding: 12px 30px;" />
            </asp:Panel>

            <asp:Repeater ID="rptSearchResults" runat="server" OnItemCommand="rptSearchResults_ItemCommand">
                <ItemTemplate>
                    <div class="salon-list-card">
                        <asp:Image ID="imgSalon" runat="server" ImageUrl='<%# Eval("ImageUrl") %>'
                            AlternateText='<%# Eval("Name") %>' CssClass="salon-list-img" />
                        <div class="salon-list-body">
                            <div class="salon-list-header-row">
                                <div class="salon-list-name"><%# Eval("Name") %></div>
                                <div class="salon-list-rating">
                                    <span class="star">&#9733;</span>
                                    <span><%# Eval("RatingDisplay") %></span>
                                </div>
                            </div>
                            <div class="salon-list-meta-row">
                                <span>&#128205;</span>
                                <span><%# Eval("Location") %></span>
                            </div>
                            <div class="salon-list-services-row">
                                <span>&#9986;</span>
                                <span><%# Eval("ServicesText") %></span>
                            </div>
                            <asp:LinkButton ID="lnkViewDetails" runat="server" Text="View Details"
                                CssClass="btn-view-details-lg" CommandName="ViewDetails"
                                CommandArgument='<%# Eval("Id") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

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
