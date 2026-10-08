<%@ Page Title="Stylio | Admin Dashboard" Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Stylio_Salon.AdminDashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="Styles/Admin.css" />
</head>
<body>
    <form id="frmAdminDashboard" runat="server">
        <asp:Panel ID="pnlDashboardWrapper" runat="server" CssClass="admin-dashboard-container">
            
            <%-- Left Sidebar --%>
            <asp:Panel ID="pnlSidebar" runat="server" CssClass="admin-sidebar">
                
                <asp:Panel ID="pnlSidebarLogoBox" runat="server" CssClass="admin-sidebar-logo-box">
                    <asp:Image ID="imgSidebarLogo" runat="server" ImageUrl="~/Images/admin_logo.png" AlternateText="Stylio Admin Panel" CssClass="admin-logo-img" />
                </asp:Panel>

                <asp:Panel ID="pnlSidebarNav" runat="server" CssClass="admin-sidebar-nav">
                    
                    <asp:HyperLink ID="lnkNavDashboard" runat="server" NavigateUrl="~/AdminDashboard.aspx" CssClass="admin-nav-item admin-nav-item-active">
                        <asp:Label ID="lblIconDashboard" runat="server" CssClass="admin-nav-icon" Text="&#9638;" />
                        <asp:Label ID="lblTextDashboard" runat="server" CssClass="admin-nav-text" Text="Dashboard" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavUsers" runat="server" NavigateUrl="#" CssClass="admin-nav-item">
                        <asp:Label ID="lblIconUsers" runat="server" CssClass="admin-nav-icon" Text="&#128100;" />
                        <asp:Label ID="lblTextUsers" runat="server" CssClass="admin-nav-text" Text="Users" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavSalons" runat="server" NavigateUrl="#" CssClass="admin-nav-item">
                        <asp:Label ID="lblIconSalons" runat="server" CssClass="admin-nav-icon" Text="&#127970;" />
                        <asp:Label ID="lblTextSalons" runat="server" CssClass="admin-nav-text" Text="Salons" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavBookings" runat="server" NavigateUrl="#" CssClass="admin-nav-item">
                        <asp:Label ID="lblIconBookings" runat="server" CssClass="admin-nav-icon" Text="&#128197;" />
                        <asp:Label ID="lblTextBookings" runat="server" CssClass="admin-nav-text" Text="Bookings" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavServices" runat="server" NavigateUrl="#" CssClass="admin-nav-item">
                        <asp:Label ID="lblIconServices" runat="server" CssClass="admin-nav-icon" Text="&#9986;" />
                        <asp:Label ID="lblTextServices" runat="server" CssClass="admin-nav-text" Text="Services" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavReviews" runat="server" NavigateUrl="#" CssClass="admin-nav-item">
                        <asp:Label ID="lblIconReviews" runat="server" CssClass="admin-nav-icon" Text="&#11088;" />
                        <asp:Label ID="lblTextReviews" runat="server" CssClass="admin-nav-text" Text="Reviews" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavPayments" runat="server" NavigateUrl="#" CssClass="admin-nav-item">
                        <asp:Label ID="lblIconPayments" runat="server" CssClass="admin-nav-icon" Text="&#128179;" />
                        <asp:Label ID="lblTextPayments" runat="server" CssClass="admin-nav-text" Text="Payments" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavSettings" runat="server" NavigateUrl="#" CssClass="admin-nav-item">
                        <asp:Label ID="lblIconSettings" runat="server" CssClass="admin-nav-icon" Text="&#9881;" />
                        <asp:Label ID="lblTextSettings" runat="server" CssClass="admin-nav-text" Text="Settings" />
                    </asp:HyperLink>

                </asp:Panel>

                <asp:Panel ID="pnlSidebarBottom" runat="server" CssClass="admin-sidebar-bottom">
                    <asp:LinkButton ID="btnNavLogout" runat="server" CssClass="admin-logout-btn" OnClick="btnNavLogout_Click">
                        <asp:Label ID="lblIconLogout" runat="server" CssClass="admin-nav-icon" Text="&#8594;" />
                        <asp:Label ID="lblTextLogout" runat="server" CssClass="admin-nav-text" Text="Logout" />
                    </asp:LinkButton>
                </asp:Panel>

            </asp:Panel>

            <%-- Main Area --%>
            <asp:Panel ID="pnlMainArea" runat="server" CssClass="admin-main-area">
                
                <%-- Topbar --%>
                <asp:Panel ID="pnlTopbar" runat="server" CssClass="admin-topbar">
                    
                    <asp:Panel ID="pnlSearchWrapper" runat="server" CssClass="admin-search-wrapper">
                        <asp:Label ID="lblSearchIcon" runat="server" CssClass="admin-search-icon" Text="&#128269;" />
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="admin-search-input" placeholder="Search Here..." />
                    </asp:Panel>

                    <asp:Panel ID="pnlProfileWidget" runat="server" CssClass="admin-profile-widget">
                        <asp:Panel ID="pnlAvatarCircle" runat="server" CssClass="admin-avatar-circle">
                            <asp:Label ID="lblAvatarIcon" runat="server" Text="&#128100;" />
                        </asp:Panel>
                        <asp:Panel ID="pnlProfileInfo" runat="server" CssClass="admin-profile-info">
                            <asp:Label ID="lblAdminRole" runat="server" CssClass="admin-profile-role" Text="Admin" />
                            <asp:Label ID="lblAdminName" runat="server" CssClass="admin-profile-name" Text="Viraj Vaja" />
                        </asp:Panel>
                    </asp:Panel>

                </asp:Panel>

                <%-- Content Area --%>
                <asp:Panel ID="pnlContentArea" runat="server" CssClass="admin-content-area">
                    
                    <asp:Label ID="lblPageTitle" runat="server" CssClass="admin-page-title" Text="Dashboard" />

                    <%-- Primary Stats Grid (4 cards) --%>
                    <asp:Panel ID="pnlStatsGrid" runat="server" CssClass="admin-stats-grid">
                        
                        <%-- Card 1: Total Users --%>
                        <asp:Panel ID="pnlStatUsers" runat="server" CssClass="admin-stat-card">
                            <asp:Label ID="lblStatUsersTitle" runat="server" CssClass="admin-stat-label" Text="Total Users" />
                            <asp:Label ID="lblStatUsersValue" runat="server" CssClass="admin-stat-value" Text="1,245" />
                            <asp:Label ID="lblStatUsersChange" runat="server" CssClass="admin-stat-change" Text="+12.0% from last month" />
                        </asp:Panel>

                        <%-- Card 2: Total Salons --%>
                        <asp:Panel ID="pnlStatSalons" runat="server" CssClass="admin-stat-card">
                            <asp:Label ID="lblStatSalonsTitle" runat="server" CssClass="admin-stat-label" Text="Total Salons" />
                            <asp:Label ID="lblStatSalonsValue" runat="server" CssClass="admin-stat-value" Text="120" />
                            <asp:Label ID="lblStatSalonsChange" runat="server" CssClass="admin-stat-change" Text="+8.3% from last month" />
                        </asp:Panel>

                        <%-- Card 3: Today's Bookings --%>
                        <asp:Panel ID="pnlStatBookings" runat="server" CssClass="admin-stat-card">
                            <asp:Label ID="lblStatBookingsTitle" runat="server" CssClass="admin-stat-label" Text="Today's Bookings" />
                            <asp:Label ID="lblStatBookingsValue" runat="server" CssClass="admin-stat-value" Text="45" />
                            <asp:Label ID="lblStatBookingsChange" runat="server" CssClass="admin-stat-change" Text="+15.2% from yesterday" />
                        </asp:Panel>

                        <%-- Card 4: Total Revenue --%>
                        <asp:Panel ID="pnlStatRevenue" runat="server" CssClass="admin-stat-card">
                            <asp:Label ID="lblStatRevenueTitle" runat="server" CssClass="admin-stat-label" Text="Total Revenue" />
                            <asp:Label ID="lblStatRevenueValue" runat="server" CssClass="admin-stat-value" Text="&#8377;1,25,000" />
                            <asp:Label ID="lblStatRevenueChange" runat="server" CssClass="admin-stat-change" Text="+12.0% from last month" />
                        </asp:Panel>

                    </asp:Panel>

                    <%-- Secondary Stats Grid (2 cards) --%>
                    <asp:Panel ID="pnlStatsSecondaryGrid" runat="server" CssClass="admin-stats-secondary-grid">
                        
                        <%-- Card 5: Total Reviews --%>
                        <asp:Panel ID="pnlStatReviews" runat="server" CssClass="admin-stat-card">
                            <asp:Label ID="lblStatReviewsTitle" runat="server" CssClass="admin-stat-label" Text="Total Reviews" />
                            <asp:Label ID="lblStatReviewsValue" runat="server" CssClass="admin-stat-value" Text="820" />
                            <asp:Label ID="lblStatReviewsChange" runat="server" CssClass="admin-stat-change" Text="+10.5% from last month" />
                        </asp:Panel>

                        <%-- Card 6: Pending Approvals --%>
                        <asp:Panel ID="pnlStatApprovals" runat="server" CssClass="admin-stat-card">
                            <asp:Label ID="lblStatApprovalsTitle" runat="server" CssClass="admin-stat-label" Text="Pending Approvals" />
                            <asp:Label ID="lblStatApprovalsValue" runat="server" CssClass="admin-stat-value" Text="12" />
                            <asp:Label ID="lblStatApprovalsChange" runat="server" CssClass="admin-stat-change" Text="+5 new today" />
                        </asp:Panel>

                    </asp:Panel>

                    <%-- Recent Bookings Section --%>
                    <asp:Label ID="lblRecentBookingsHeading" runat="server" CssClass="admin-section-title" Text="Recent Bookings" />

                    <asp:Panel ID="pnlRecentBookingsCard" runat="server" CssClass="admin-bookings-card">
                        
                        <%-- Row 1: Viraj Vaja --%>
                        <asp:Panel ID="pnlBookingRow1" runat="server" CssClass="admin-booking-row">
                            <asp:Panel ID="pnlAvatar1" runat="server" CssClass="admin-user-avatar avatar-coral">
                                <asp:Label ID="lblAvatar1Icon" runat="server" Text="&#128100;" />
                            </asp:Panel>
                            <asp:Label ID="lblBooking1Name" runat="server" CssClass="admin-booking-name" Text="Viraj Vaja" />
                            <asp:Label ID="lblBooking1Salon" runat="server" CssClass="admin-booking-salon" Text="Stylio Men's Salon" />
                            <asp:Label ID="lblBooking1Date" runat="server" CssClass="admin-booking-date" Text="08 Aug-2026" />
                            <asp:Panel ID="pnlStatus1" runat="server">
                                <asp:Label ID="lblStatus1Badge" runat="server" CssClass="admin-status-badge badge-completed" Text="Completed" />
                            </asp:Panel>
                        </asp:Panel>

                        <%-- Row 2: Khush Patel --%>
                        <asp:Panel ID="pnlBookingRow2" runat="server" CssClass="admin-booking-row">
                            <asp:Panel ID="pnlAvatar2" runat="server" CssClass="admin-user-avatar avatar-teal">
                                <asp:Label ID="lblAvatar2Icon" runat="server" Text="&#128100;" />
                            </asp:Panel>
                            <asp:Label ID="lblBooking2Name" runat="server" CssClass="admin-booking-name" Text="Khush Patel" />
                            <asp:Label ID="lblBooking2Salon" runat="server" CssClass="admin-booking-salon" Text="The Hair Studio" />
                            <asp:Label ID="lblBooking2Date" runat="server" CssClass="admin-booking-date" Text="07 Aug-2026" />
                            <asp:Panel ID="pnlStatus2" runat="server">
                                <asp:Label ID="lblStatus2Badge" runat="server" CssClass="admin-status-badge badge-pending" Text="Pending" />
                            </asp:Panel>
                        </asp:Panel>

                        <%-- Row 3: Meet Patel --%>
                        <asp:Panel ID="pnlBookingRow3" runat="server" CssClass="admin-booking-row">
                            <asp:Panel ID="pnlAvatar3" runat="server" CssClass="admin-user-avatar avatar-coral">
                                <asp:Label ID="lblAvatar3Icon" runat="server" Text="&#128100;" />
                            </asp:Panel>
                            <asp:Label ID="lblBooking3Name" runat="server" CssClass="admin-booking-name" Text="Meet Patel" />
                            <asp:Label ID="lblBooking3Salon" runat="server" CssClass="admin-booking-salon" Text="The Mea Men Salon" />
                            <asp:Label ID="lblBooking3Date" runat="server" CssClass="admin-booking-date" Text="06 Aug-2026" />
                            <asp:Panel ID="pnlStatus3" runat="server">
                                <asp:Label ID="lblStatus3Badge" runat="server" CssClass="admin-status-badge badge-completed" Text="Completed" />
                            </asp:Panel>
                        </asp:Panel>

                    </asp:Panel>

                </asp:Panel>

            </asp:Panel>

        </asp:Panel>
    </form>
</body>
</html>
