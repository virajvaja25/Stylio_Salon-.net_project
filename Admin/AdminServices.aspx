<%@ Page Title="Stylio | Admin Services" Language="C#" AutoEventWireup="true" CodeBehind="AdminServices.aspx.cs" Inherits="Stylio_Salon.AdminServices" ResponseEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Services</title>
    <link rel="stylesheet" type="text/css" href="../Styles/Admin.css" />
</head>
<body>
    <form id="frmAdminServices" runat="server">
        <asp:Panel ID="pnlDashboardWrapper" runat="server" CssClass="admin-dashboard-container">
            
            <%-- Left Sidebar --%>
            <asp:Panel ID="pnlSidebar" runat="server" CssClass="admin-sidebar">
                
                <asp:Panel ID="pnlSidebarLogoBox" runat="server" CssClass="admin-sidebar-logo-box">
                    <asp:Image ID="imgSidebarLogo" runat="server" ImageUrl="~/Images/admin_logo.png" AlternateText="Stylio Admin Panel" CssClass="admin-logo-img" />
                </asp:Panel>

                <asp:Panel ID="pnlSidebarNav" runat="server" CssClass="admin-sidebar-nav">
                    
                    <asp:HyperLink ID="lnkNavDashboard" runat="server" NavigateUrl="~/Admin/AdminDashboard.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavDashboard" runat="server" ImageUrl="~/Images/admin_icons/dashboard.svg" CssClass="admin-nav-svg-icon" AlternateText="Dashboard" />
                        <asp:Label ID="lblTextDashboard" runat="server" CssClass="admin-nav-text" Text="Dashboard" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavUsers" runat="server" NavigateUrl="~/Admin/AdminUsers.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavUsers" runat="server" ImageUrl="~/Images/admin_icons/users.svg" CssClass="admin-nav-svg-icon" AlternateText="Users" />
                        <asp:Label ID="lblTextUsers" runat="server" CssClass="admin-nav-text" Text="Users" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavSalons" runat="server" NavigateUrl="~/Admin/AdminSalons.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavSalons" runat="server" ImageUrl="~/Images/admin_icons/salons.svg" CssClass="admin-nav-svg-icon" AlternateText="Salons" />
                        <asp:Label ID="lblTextSalons" runat="server" CssClass="admin-nav-text" Text="Salons" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavBookings" runat="server" NavigateUrl="~/Admin/AdminBookings.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavBookings" runat="server" ImageUrl="~/Images/admin_icons/bookings.svg" CssClass="admin-nav-svg-icon" AlternateText="Bookings" />
                        <asp:Label ID="lblTextBookings" runat="server" CssClass="admin-nav-text" Text="Bookings" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavServices" runat="server" NavigateUrl="~/Admin/AdminServices.aspx" CssClass="admin-nav-item admin-nav-item-active">
                        <asp:Image ID="imgNavServices" runat="server" ImageUrl="~/Images/admin_icons/services.svg" CssClass="admin-nav-svg-icon" AlternateText="Services" />
                        <asp:Label ID="lblTextServices" runat="server" CssClass="admin-nav-text" Text="Services" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavReviews" runat="server" NavigateUrl="~/Admin/AdminReviews.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavReviews" runat="server" ImageUrl="~/Images/admin_icons/reviews.svg" CssClass="admin-nav-svg-icon" AlternateText="Reviews" />
                        <asp:Label ID="lblTextReviews" runat="server" CssClass="admin-nav-text" Text="Reviews" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavPayments" runat="server" NavigateUrl="~/Admin/AdminPayments.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavPayments" runat="server" ImageUrl="~/Images/admin_icons/payments.svg" CssClass="admin-nav-svg-icon" AlternateText="Payments" />
                        <asp:Label ID="lblTextPayments" runat="server" CssClass="admin-nav-text" Text="Payments" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavSettings" runat="server" NavigateUrl="~/Admin/AdminSettings.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavSettings" runat="server" ImageUrl="~/Images/admin_icons/settings.svg" CssClass="admin-nav-svg-icon" AlternateText="Settings" />
                        <asp:Label ID="lblTextSettings" runat="server" CssClass="admin-nav-text" Text="Settings" />
                    </asp:HyperLink>

                </asp:Panel>

                <asp:Panel ID="pnlSidebarBottom" runat="server" CssClass="admin-sidebar-bottom">
                    <asp:LinkButton ID="btnNavLogout" runat="server" CssClass="admin-logout-btn" OnClick="btnNavLogout_Click">
                        <asp:Image ID="imgNavLogout" runat="server" ImageUrl="~/Images/admin_icons/logout.svg" CssClass="admin-nav-svg-icon" AlternateText="Logout" />
                        <asp:Label ID="lblTextLogout" runat="server" CssClass="admin-nav-text" Text="Logout" />
                    </asp:LinkButton>
                </asp:Panel>

            </asp:Panel>

            <%-- Main Area --%>
            <asp:Panel ID="pnlMainArea" runat="server" CssClass="admin-main-area">
                
                <%-- Top Bar --%>
                <asp:Panel ID="pnlTopBar" runat="server" CssClass="admin-topbar">
                    
                    <asp:Panel ID="pnlSearchWrapper" runat="server" CssClass="admin-search-wrapper">
                        <asp:Panel ID="pnlSearchIcon" runat="server" CssClass="admin-search-icon">
                            <asp:Image ID="imgSearchIcon" runat="server" ImageUrl="~/Images/admin_icons/search.svg" CssClass="admin-search-svg-icon" AlternateText="Search" />
                        </asp:Panel>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="admin-search-input" placeholder="Search Here..." />
                    </asp:Panel>

                    <asp:Panel ID="pnlProfileWidget" runat="server" CssClass="admin-profile-widget">
                        <asp:Panel ID="pnlAvatarCircle" runat="server" CssClass="admin-avatar-circle">
                            <asp:Image ID="imgAdminAvatar" runat="server" ImageUrl="~/Images/admin_icons/admin_avatar.svg" CssClass="admin-avatar-img" AlternateText="Admin Profile" />
                        </asp:Panel>
                        <asp:Panel ID="pnlProfileInfo" runat="server" CssClass="admin-profile-info">
                            <asp:Label ID="lblAdminRole" runat="server" CssClass="admin-profile-role" Text="Admin" />
                            <asp:Label ID="lblAdminName" runat="server" CssClass="admin-profile-name" Text="Viraj Vaja" />
                        </asp:Panel>
                    </asp:Panel>

                </asp:Panel>

                <%-- Content Area --%>
                <asp:Panel ID="pnlContentArea" runat="server" CssClass="admin-content-area">
                    
                    <%-- Header Row with Services Title & +Add Service Button --%>
                    <asp:Panel ID="pnlServicesHeaderRow" runat="server" CssClass="admin-services-header-row">
                        <asp:Label ID="lblPageTitle" runat="server" CssClass="admin-page-title" Text="Services" />
                        <asp:HyperLink ID="btnAddServiceTop" runat="server" NavigateUrl="~/Admin/AdminAddService.aspx" CssClass="btn-admin-add-service-top" Text="+Add Service" />
                    </asp:Panel>

                    <%-- Search Services Input --%>
                    <asp:Panel ID="pnlServicesSearchBox" runat="server" CssClass="admin-services-search-wrapper">
                        <asp:Image ID="imgSearchServicesIcon" runat="server" ImageUrl="~/Images/admin_icons/search.svg" CssClass="admin-services-search-icon" AlternateText="Search" />
                        <asp:TextBox ID="txtSearchServices" runat="server" CssClass="admin-services-search-input" placeholder="Search Service..." AutoPostBack="true" OnTextChanged="txtSearchServices_TextChanged" />
                    </asp:Panel>

                    <%-- Services Table Card --%>
                    <asp:Panel ID="pnlServicesTableCard" runat="server" CssClass="admin-services-table-card">
                        
                        <%-- Header Row --%>
                        <asp:Panel ID="pnlTableHeader" runat="server" CssClass="admin-services-table-header">
                            <asp:Label ID="lblColService" runat="server" Text="Service" />
                            <asp:Label ID="lblColSalon" runat="server" Text="Salon" />
                            <asp:Label ID="lblColDuration" runat="server" Text="Duration" />
                            <asp:Label ID="lblColStatus" runat="server" Text="Status" />
                            <asp:Label ID="lblColPrice" runat="server" Text="Price" />
                        </asp:Panel>

                        <%-- Services List Repeater --%>
                        <asp:Repeater ID="rptServices" runat="server">
                            <ItemTemplate>
                                <asp:Panel ID="pnlServiceRow" runat="server" CssClass="admin-services-row">
                                    
                                    <asp:Panel ID="pnlServiceNameCell" runat="server" CssClass="admin-service-cell-name">
                                        <asp:Image ID="imgServiceAvatar" runat="server" ImageUrl='<%# Eval("AvatarUrl") %>' CssClass="admin-service-avatar" AlternateText='<%# Eval("ServiceName") %>' />
                                        <asp:Label ID="lblServiceName" runat="server" CssClass="admin-service-name-text" Text='<%# Eval("ServiceName") %>' />
                                    </asp:Panel>

                                    <asp:Label ID="lblSalon" runat="server" CssClass="admin-service-cell-salon" Text='<%# Eval("SalonName") %>' />

                                    <asp:Label ID="lblDuration" runat="server" CssClass="admin-service-cell-duration" Text='<%# Eval("Duration") %>' />

                                    <asp:Panel ID="pnlStatusCell" runat="server">
                                        <asp:Label ID="lblStatus" runat="server" CssClass='<%# Eval("StatusCssClass") %>' Text='<%# Eval("Status") %>' />
                                    </asp:Panel>

                                    <asp:Label ID="lblPrice" runat="server" CssClass="admin-service-cell-price" Text='<%# Eval("Price") %>' />

                                </asp:Panel>
                            </ItemTemplate>
                        </asp:Repeater>

                        <%-- Empty State --%>
                        <asp:Panel ID="pnlNoServices" runat="server" Visible="false" style="padding: 30px; text-align: center; color: #888;">
                            <asp:Label ID="lblNoServices" runat="server" Text="No services found matching your search." />
                        </asp:Panel>

                        <%-- Pagination Bar --%>
                        <asp:Panel ID="pnlServicesPagination" runat="server" CssClass="admin-users-pagination">
                            <asp:Label ID="lblPaginationInfo" runat="server" CssClass="admin-users-pagination-info" Text="Showing 1 to 5 of 200 services" />
                            <asp:Panel ID="pnlPaginationControls" runat="server" CssClass="admin-pagination-controls">
                                <asp:LinkButton ID="btnPrevPage" runat="server" CssClass="admin-page-btn" Text="&lt;" ToolTip="Previous" />
                                <asp:LinkButton ID="btnPage1" runat="server" CssClass="admin-page-btn admin-page-btn-active" Text="1" />
                                <asp:LinkButton ID="btnPage2" runat="server" CssClass="admin-page-btn" Text="2" />
                                <asp:Label ID="lblEllipsis" runat="server" CssClass="admin-page-ellipsis" Text="..." />
                                <asp:LinkButton ID="btnPageLast" runat="server" CssClass="admin-page-btn" Text="249" />
                                <asp:LinkButton ID="btnNextPage" runat="server" CssClass="admin-page-btn" Text="&gt;" ToolTip="Next" />
                            </asp:Panel>
                        </asp:Panel>

                    </asp:Panel>

                </asp:Panel>

            </asp:Panel>

        </asp:Panel>
    </form>
</body>
</html>
