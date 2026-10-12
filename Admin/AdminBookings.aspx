<%@ Page Title="Stylio | Manage Booking" Language="C#" AutoEventWireup="true" CodeBehind="AdminBookings.aspx.cs" Inherits="Stylio_Salon.AdminBookings" ResponseEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Manage Booking</title>
    <link rel="stylesheet" type="text/css" href="../Styles/Admin.css" />
</head>
<body>
    <form id="frmAdminBookings" runat="server">
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

                    <asp:HyperLink ID="lnkNavUsers" runat="server" NavigateUrl="~/Admin/AdminAddUser.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavUsers" runat="server" ImageUrl="~/Images/admin_icons/users.svg" CssClass="admin-nav-svg-icon" AlternateText="Users" />
                        <asp:Label ID="lblTextUsers" runat="server" CssClass="admin-nav-text" Text="Users" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavSalons" runat="server" NavigateUrl="~/Admin/AdminSalons.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavSalons" runat="server" ImageUrl="~/Images/admin_icons/salons.svg" CssClass="admin-nav-svg-icon" AlternateText="Salons" />
                        <asp:Label ID="lblTextSalons" runat="server" CssClass="admin-nav-text" Text="Salons" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavBookings" runat="server" NavigateUrl="~/Admin/AdminBookings.aspx" CssClass="admin-nav-item admin-nav-item-active">
                        <asp:Image ID="imgNavBookings" runat="server" ImageUrl="~/Images/admin_icons/bookings.svg" CssClass="admin-nav-svg-icon" AlternateText="Bookings" />
                        <asp:Label ID="lblTextBookings" runat="server" CssClass="admin-nav-text" Text="Bookings" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavServices" runat="server" NavigateUrl="~/Admin/AdminAddService.aspx" CssClass="admin-nav-item">
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

                    <asp:HyperLink ID="lnkNavSettings" runat="server" NavigateUrl="#" CssClass="admin-nav-item">
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
                    
                    <%-- Page Title --%>
                    <asp:Label ID="lblPageTitle" runat="server" CssClass="admin-page-title" Text="Manage Booking" />

                    <%-- Filter Tabs: All, Upcoming, Completed, Cancelled --%>
                    <asp:Panel ID="pnlBookingTabs" runat="server" CssClass="admin-booking-tabs-row">
                        <asp:LinkButton ID="btnTabAll" runat="server" CssClass="admin-booking-tab admin-booking-tab-active" Text="All" OnClick="btnTabAll_Click" />
                        <asp:LinkButton ID="btnTabUpcoming" runat="server" CssClass="admin-booking-tab" Text="Upcoming" OnClick="btnTabUpcoming_Click" />
                        <asp:LinkButton ID="btnTabCompleted" runat="server" CssClass="admin-booking-tab" Text="Completed" OnClick="btnTabCompleted_Click" />
                        <asp:LinkButton ID="btnTabCancelled" runat="server" CssClass="admin-booking-tab" Text="Cancelled" OnClick="btnTabCancelled_Click" />
                    </asp:Panel>

                    <%-- Search Booking Bar --%>
                    <asp:Panel ID="pnlBookingSearchBox" runat="server" CssClass="admin-booking-search-wrapper">
                        <asp:Image ID="imgBookingSearchIcon" runat="server" ImageUrl="~/Images/admin_icons/search.svg" CssClass="admin-booking-search-icon" AlternateText="Search" />
                        <asp:TextBox ID="txtSearchBooking" runat="server" CssClass="admin-booking-search-input" placeholder="Search Booking" AutoPostBack="true" OnTextChanged="txtSearchBooking_TextChanged" />
                    </asp:Panel>

                    <%-- Bookings List Card --%>
                    <asp:Panel ID="pnlManageBookingsCard" runat="server" CssClass="admin-manage-bookings-card">
                        
                        <%-- Bookings Repeater --%>
                        <asp:Repeater ID="rptBookings" runat="server" OnItemCommand="rptBookings_ItemCommand">
                            <ItemTemplate>
                                <asp:Panel ID="pnlBookingRow" runat="server" CssClass="admin-manage-booking-row">
                                    
                                    <%-- Customer Details --%>
                                    <asp:Panel ID="pnlCustomer" runat="server" CssClass="admin-manage-booking-customer">
                                        <asp:Image ID="imgAvatar" runat="server" ImageUrl='<%# Eval("AvatarUrl") %>' CssClass="admin-manage-booking-avatar" AlternateText='<%# Eval("CustomerName") %>' />
                                        <asp:Panel ID="pnlCustomerInfo" runat="server" CssClass="admin-manage-booking-customer-info">
                                            <asp:Label ID="lblCustName" runat="server" CssClass="admin-manage-booking-name" Text='<%# Eval("CustomerName") %>' />
                                            <asp:Label ID="lblCustEmail" runat="server" CssClass="admin-manage-booking-email" Text='<%# Eval("CustomerEmail") %>' />
                                            <asp:Label ID="lblCustService" runat="server" CssClass="admin-manage-booking-service" Text='<%# Eval("Service") %>' />
                                        </asp:Panel>
                                    </asp:Panel>

                                    <%-- Date & Time --%>
                                    <asp:Panel ID="pnlDateTime" runat="server" CssClass="admin-manage-booking-datetime">
                                        <asp:Label ID="lblDate" runat="server" CssClass="admin-manage-booking-date" Text='<%# Eval("BookingDate") %>' />
                                        <asp:Label ID="lblTime" runat="server" CssClass="admin-manage-booking-time" Text='<%# Eval("BookingTime") %>' />
                                    </asp:Panel>

                                    <%-- Status Badge --%>
                                    <asp:Panel ID="pnlStatusBox" runat="server" CssClass="admin-manage-booking-status-box">
                                        <asp:Label ID="lblStatus" runat="server" CssClass='<%# Eval("StatusCssClass") %>' Text='<%# Eval("StatusDisplay") %>' />
                                    </asp:Panel>

                                    <%-- Action Button: View --%>
                                    <asp:Panel ID="pnlActionBox" runat="server" CssClass="admin-manage-booking-action">
                                        <asp:LinkButton ID="btnViewBooking" runat="server" CommandName="ViewDetails" CommandArgument='<%# Eval("BookingId") %>' CssClass="admin-btn-booking-view" Text="View" />
                                    </asp:Panel>

                                </asp:Panel>
                            </ItemTemplate>
                        </asp:Repeater>

                        <%-- Empty State if no results --%>
                        <asp:Panel ID="pnlNoBookings" runat="server" Visible="false" style="padding: 40px; text-align: center; color: #888;">
                            <asp:Label ID="lblNoBookings" runat="server" Text="No bookings found for the selected filter." style="font-size: 16px; font-weight: 500;" />
                        </asp:Panel>

                        <%-- Pagination Row --%>
                        <asp:Panel ID="pnlBookingPagination" runat="server" CssClass="admin-manage-booking-pagination">
                            <asp:Label ID="lblPaginationInfo" runat="server" CssClass="admin-manage-booking-page-info" Text="Showing 1 to 3 of 56 bookings" />
                            <asp:Panel ID="pnlPaginationControls" runat="server" CssClass="admin-pagination-controls">
                                <asp:LinkButton ID="btnPrevPage" runat="server" CssClass="admin-page-btn" Text="&lt;" ToolTip="Previous" />
                                <asp:LinkButton ID="btnPage1" runat="server" CssClass="admin-page-btn admin-page-btn-active" Text="1" />
                                <asp:LinkButton ID="btnPage2" runat="server" CssClass="admin-page-btn" Text="2" />
                                <asp:Label ID="lblEllipsis" runat="server" CssClass="admin-page-ellipsis" Text="..." />
                                <asp:LinkButton ID="btnPageLast" runat="server" CssClass="admin-page-btn" Text="20" />
                                <asp:LinkButton ID="btnNextPage" runat="server" CssClass="admin-page-btn" Text="&gt;" ToolTip="Next" />
                            </asp:Panel>
                        </asp:Panel>

                    </asp:Panel>

                </asp:Panel>

            </asp:Panel>

            <%-- Booking Details Modal (Pure ASP Controls) --%>
            <asp:Panel ID="pnlBookingDetailsModal" runat="server" CssClass="admin-modal-overlay" Visible="false">
                <asp:Panel ID="pnlModalCard" runat="server" CssClass="admin-modal-card">
                    <asp:Panel ID="pnlModalHeader" runat="server" CssClass="admin-modal-header">
                        <asp:Label ID="lblModalTitle" runat="server" CssClass="admin-modal-title" Text="Booking Details" />
                        <asp:LinkButton ID="btnCloseX" runat="server" Text="✕" OnClick="btnCloseModal_Click" CssClass="admin-modal-close-x" />
                    </asp:Panel>
                    <asp:Panel ID="pnlModalBody" runat="server" CssClass="admin-modal-body">
                        <asp:Panel ID="pnlRowCustName" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyCustName" runat="server" CssClass="admin-detail-key" Text="Customer:" />
                            <asp:Label ID="lblValCustName" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowCustEmail" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyCustEmail" runat="server" CssClass="admin-detail-key" Text="Email:" />
                            <asp:Label ID="lblValCustEmail" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowService" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyService" runat="server" CssClass="admin-detail-key" Text="Service:" />
                            <asp:Label ID="lblValService" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowDateTime" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyDateTime" runat="server" CssClass="admin-detail-key" Text="Date & Time:" />
                            <asp:Label ID="lblValDateTime" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowSalon" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeySalon" runat="server" CssClass="admin-detail-key" Text="Salon:" />
                            <asp:Label ID="lblValSalon" runat="server" CssClass="admin-detail-val" Text="Stylio Men's Salon" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowAmount" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyAmount" runat="server" CssClass="admin-detail-key" Text="Amount:" />
                            <asp:Label ID="lblValAmount" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowStatus" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyStatus" runat="server" CssClass="admin-detail-key" Text="Status:" />
                            <asp:Label ID="lblValStatus" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                    </asp:Panel>
                    <asp:Panel ID="pnlModalFooter" runat="server" CssClass="admin-modal-footer">
                        <asp:Button ID="btnCloseModal" runat="server" CssClass="btn-admin-submit" Text="Close" OnClick="btnCloseModal_Click" />
                    </asp:Panel>
                </asp:Panel>
            </asp:Panel>

        </asp:Panel>
    </form>
</body>
</html>
