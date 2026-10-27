<%@ Page Title="Stylio | Admin Payments" Language="C#" AutoEventWireup="true" CodeBehind="AdminPayments.aspx.cs" Inherits="Stylio_Salon.AdminPayments" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Payments</title>
    <link rel="stylesheet" type="text/css" href="../Styles/Admin.css" />
    <script type="text/javascript">
        function togglePaymentMenu(menuId, event) {
            if (event) {
                event.stopPropagation();
                if (event.preventDefault) event.preventDefault();
            }
            var menus = document.querySelectorAll('.admin-salon-dropdown-menu');
            for (var i = 0; i < menus.length; i++) {
                if (menus[i].id !== menuId) {
                    menus[i].style.display = 'none';
                }
            }
            var targetMenu = document.getElementById(menuId);
            if (targetMenu) {
                targetMenu.style.display = (targetMenu.style.display === 'block') ? 'none' : 'block';
            }
        }
        document.addEventListener('click', function (e) {
            if (!e.target.closest('.admin-more-menu-container')) {
                var menus = document.querySelectorAll('.admin-salon-dropdown-menu');
                for (var i = 0; i < menus.length; i++) {
                    menus[i].style.display = 'none';
                }
            }
        });
    </script>
</head>
<body>
    <form id="frmAdminPayments" runat="server">
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

                    <asp:HyperLink ID="lnkNavServices" runat="server" NavigateUrl="~/Admin/AdminServices.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavServices" runat="server" ImageUrl="~/Images/admin_icons/services.svg" CssClass="admin-nav-svg-icon" AlternateText="Services" />
                        <asp:Label ID="lblTextServices" runat="server" CssClass="admin-nav-text" Text="Services" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavReviews" runat="server" NavigateUrl="~/Admin/AdminReviews.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavReviews" runat="server" ImageUrl="~/Images/admin_icons/reviews.svg" CssClass="admin-nav-svg-icon" AlternateText="Reviews" />
                        <asp:Label ID="lblTextReviews" runat="server" CssClass="admin-nav-text" Text="Reviews" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavPayments" runat="server" NavigateUrl="~/Admin/AdminPayments.aspx" CssClass="admin-nav-item admin-nav-item-active">
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
                    
                    <%-- Alert Notification Banner --%>
                    <asp:Panel ID="pnlAlertBanner" runat="server" CssClass="admin-banner-alert admin-banner-alert-success" Visible="false">
                        <asp:Label ID="lblAlertMessage" runat="server" />
                        <asp:LinkButton ID="btnCloseAlert" runat="server" Text="✕" OnClick="btnCloseAlert_Click" style="color: inherit; text-decoration: none; font-weight: bold; cursor: pointer;" />
                    </asp:Panel>

                    <asp:Label ID="lblPageTitle" runat="server" CssClass="admin-page-title" Text="Payments" />

                    <%-- Top 3 Stat Cards --%>
                    <asp:Panel ID="pnlStatsGrid" runat="server" CssClass="admin-payments-stats-grid">
                        
                        <%-- Card 1: Today Revenue --%>
                        <asp:Panel ID="pnlStatToday" runat="server" CssClass="admin-payment-stat-card">
                            <asp:Label ID="lblTodayTitle" runat="server" CssClass="admin-payment-stat-title" Text="Today Revenue" />
                            <asp:Panel ID="pnlTodayMid" runat="server" CssClass="admin-payment-stat-middle">
                                <asp:Image ID="imgWalletToday" runat="server" ImageUrl="~/Images/admin_icons/wallet_card.svg" CssClass="admin-payment-stat-icon" AlternateText="Wallet" />
                                <asp:Label ID="lblTodayValue" runat="server" CssClass="admin-payment-stat-value" Text="1,250" />
                            </asp:Panel>
                            <asp:Label ID="lblTodayChange" runat="server" CssClass="admin-payment-stat-change" Text="+12.0% From Yesterday" />
                        </asp:Panel>

                        <%-- Card 2: Total Revenue --%>
                        <asp:Panel ID="pnlStatTotal" runat="server" CssClass="admin-payment-stat-card">
                            <asp:Label ID="lblTotalTitle" runat="server" CssClass="admin-payment-stat-title" Text="Total Revenue" />
                            <asp:Panel ID="pnlTotalMid" runat="server" CssClass="admin-payment-stat-middle">
                                <asp:Image ID="imgMoneyBag" runat="server" ImageUrl="~/Images/admin_icons/money_bag.svg" CssClass="admin-payment-stat-icon" AlternateText="Total Revenue" />
                                <asp:Label ID="lblTotalValue" runat="server" CssClass="admin-payment-stat-value" Text="&#8377;1,25,000" />
                            </asp:Panel>
                            <asp:Label ID="lblTotalChange" runat="server" CssClass="admin-payment-stat-change" Text="+8.3% From Last Month" />
                        </asp:Panel>

                        <%-- Card 3: New users --%>
                        <asp:Panel ID="pnlStatNewUsers" runat="server" CssClass="admin-payment-stat-card">
                            <asp:Label ID="lblNewUsersTitle" runat="server" CssClass="admin-payment-stat-title" Text="New users" />
                            <asp:Panel ID="pnlNewUsersMid" runat="server" CssClass="admin-payment-stat-middle">
                                <asp:Image ID="imgUserStat" runat="server" ImageUrl="~/Images/admin_icons/user_stat.svg" CssClass="admin-payment-stat-icon" AlternateText="Users" />
                                <asp:Label ID="lblNewUsersValue" runat="server" CssClass="admin-payment-stat-value" Text="320" />
                            </asp:Panel>
                            <asp:Label ID="lblNewUsersChange" runat="server" CssClass="admin-payment-stat-change" Text="+15.2% From Last Month" />
                        </asp:Panel>

                    </asp:Panel>

                    <%-- Section Heading --%>
                    <asp:Label ID="lblRecentPaymentsTitle" runat="server" CssClass="admin-section-title" Text="Recent Payments" />

                    <%-- Payments Table Card --%>
                    <asp:Panel ID="pnlPaymentsTableCard" runat="server" CssClass="admin-payments-table-card">
                        
                        <%-- Header Row --%>
                        <asp:Panel ID="pnlTableHeader" runat="server" CssClass="admin-payments-header-row">
                            <asp:Label ID="lblColCustomer" runat="server" Text="Customer" />
                            <asp:Label ID="lblColAmount" runat="server" Text="Amount" />
                            <asp:Label ID="lblColService" runat="server" Text="Service" />
                            <asp:Label ID="lblColMethod" runat="server" Text="Method" />
                            <asp:Label ID="lblColDate" runat="server" Text="Date" />
                            <asp:Label ID="lblColAction" runat="server" Text="" />
                        </asp:Panel>

                        <%-- Row 1: Viraj Vaja --%>
                        <asp:Panel ID="pnlPaymentRow1" runat="server" CssClass="admin-payment-row">
                            <asp:Panel ID="pnlCustomer1" runat="server" CssClass="admin-payment-customer">
                                <asp:Image ID="imgCustAvatar1" runat="server" ImageUrl="~/Images/admin_icons/avatar_coral.svg" CssClass="admin-payment-avatar" AlternateText="Viraj Vaja" />
                                <asp:Label ID="lblCustName1" runat="server" CssClass="admin-payment-customer-name" Text="Viraj Vaja" />
                            </asp:Panel>
                            <asp:Label ID="lblAmount1" runat="server" CssClass="admin-payment-amount" Text="&#8377;500" />
                            <asp:Label ID="lblService1" runat="server" CssClass="admin-payment-service" Text="Hair Cut" />
                            <asp:Panel ID="pnlMethod1" runat="server" CssClass="admin-payment-method-box">
                                <asp:Image ID="imgMethod1" runat="server" ImageUrl="~/Images/admin_icons/wallet_card.svg" CssClass="admin-payment-method-icon" AlternateText="Cash" />
                                <asp:Label ID="lblMethod1" runat="server" CssClass="admin-payment-method-text" Text="Cash" />
                            </asp:Panel>
                            <asp:Label ID="lblDate1" runat="server" CssClass="admin-payment-date" Text="8 Aug, 2026" />
                            <asp:Panel ID="pnlMoreWrapper1" runat="server" CssClass="admin-more-menu-container">
                                <asp:LinkButton ID="btnMore1" runat="server" CssClass="admin-more-dots-btn" OnClientClick="togglePaymentMenu('pnlMenu1', event); return false;" ToolTip="Options">
                                    <asp:Image ID="imgDots1" runat="server" ImageUrl="~/Images/admin_icons/more_vert.svg" AlternateText="⋮" />
                                </asp:LinkButton>
                                <asp:Panel ID="pnlMenu1" runat="server" ClientIDMode="Static" CssClass="admin-salon-dropdown-menu" style="display: none; min-width: 160px; right: 0;">
                                    <asp:LinkButton ID="btnDetails1" runat="server" CssClass="admin-dropdown-action" OnClick="btnDetails1_Click">
                                        <asp:Label ID="lblDetText1" runat="server" Text="View Receipt" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnPrint1" runat="server" CssClass="admin-dropdown-action" OnClick="btnPrint1_Click">
                                        <asp:Label ID="lblPrintText1" runat="server" Text="Print Receipt" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnComplete1" runat="server" CssClass="admin-dropdown-action" OnClick="btnComplete1_Click">
                                        <asp:Label ID="lblCompleteText1" runat="server" Text="Mark Completed" />
                                    </asp:LinkButton>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>

                        <%-- Row 2: Khush Patel --%>
                        <asp:Panel ID="pnlPaymentRow2" runat="server" CssClass="admin-payment-row">
                            <asp:Panel ID="pnlCustomer2" runat="server" CssClass="admin-payment-customer">
                                <asp:Image ID="imgCustAvatar2" runat="server" ImageUrl="~/Images/admin_icons/avatar_teal.svg" CssClass="admin-payment-avatar" AlternateText="Khush Patel" />
                                <asp:Label ID="lblCustName2" runat="server" CssClass="admin-payment-customer-name" Text="Khush Patel" />
                            </asp:Panel>
                            <asp:Label ID="lblAmount2" runat="server" CssClass="admin-payment-amount" Text="&#8377;200" />
                            <asp:Label ID="lblService2" runat="server" CssClass="admin-payment-service" Text="Beard Trim" />
                            <asp:Panel ID="pnlMethod2" runat="server" CssClass="admin-payment-method-box">
                                <asp:Image ID="imgMethod2" runat="server" ImageUrl="~/Images/admin_icons/wallet_card.svg" CssClass="admin-payment-method-icon" AlternateText="Cash" />
                                <asp:Label ID="lblMethod2" runat="server" CssClass="admin-payment-method-text" Text="Cash" />
                            </asp:Panel>
                            <asp:Label ID="lblDate2" runat="server" CssClass="admin-payment-date" Text="9 Aug, 2026" />
                            <asp:Panel ID="pnlMoreWrapper2" runat="server" CssClass="admin-more-menu-container">
                                <asp:LinkButton ID="btnMore2" runat="server" CssClass="admin-more-dots-btn" OnClientClick="togglePaymentMenu('pnlMenu2', event); return false;" ToolTip="Options">
                                    <asp:Image ID="imgDots2" runat="server" ImageUrl="~/Images/admin_icons/more_vert.svg" AlternateText="⋮" />
                                </asp:LinkButton>
                                <asp:Panel ID="pnlMenu2" runat="server" ClientIDMode="Static" CssClass="admin-salon-dropdown-menu" style="display: none; min-width: 160px; right: 0;">
                                    <asp:LinkButton ID="btnDetails2" runat="server" CssClass="admin-dropdown-action" OnClick="btnDetails2_Click">
                                        <asp:Label ID="lblDetText2" runat="server" Text="View Receipt" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnPrint2" runat="server" CssClass="admin-dropdown-action" OnClick="btnPrint2_Click">
                                        <asp:Label ID="lblPrintText2" runat="server" Text="Print Receipt" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnComplete2" runat="server" CssClass="admin-dropdown-action" OnClick="btnComplete2_Click">
                                        <asp:Label ID="lblCompleteText2" runat="server" Text="Mark Completed" />
                                    </asp:LinkButton>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>

                        <%-- Row 3: Meet Patel --%>
                        <asp:Panel ID="pnlPaymentRow3" runat="server" CssClass="admin-payment-row">
                            <asp:Panel ID="pnlCustomer3" runat="server" CssClass="admin-payment-customer">
                                <asp:Image ID="imgCustAvatar3" runat="server" ImageUrl="~/Images/admin_icons/avatar_coral.svg" CssClass="admin-payment-avatar" AlternateText="Meet Patel" />
                                <asp:Label ID="lblCustName3" runat="server" CssClass="admin-payment-customer-name" Text="Meet Patel" />
                            </asp:Panel>
                            <asp:Label ID="lblAmount3" runat="server" CssClass="admin-payment-amount" Text="&#8377;800" />
                            <asp:Label ID="lblService3" runat="server" CssClass="admin-payment-service" Text="Hair Color" />
                            <asp:Panel ID="pnlMethod3" runat="server" CssClass="admin-payment-method-box">
                                <asp:Image ID="imgMethod3" runat="server" ImageUrl="~/Images/admin_icons/wallet_card.svg" CssClass="admin-payment-method-icon" AlternateText="Cash" />
                                <asp:Label ID="lblMethod3" runat="server" CssClass="admin-payment-method-text" Text="Cash" />
                            </asp:Panel>
                            <asp:Label ID="lblDate3" runat="server" CssClass="admin-payment-date" Text="9 Aug, 2026" />
                            <asp:Panel ID="pnlMoreWrapper3" runat="server" CssClass="admin-more-menu-container">
                                <asp:LinkButton ID="btnMore3" runat="server" CssClass="admin-more-dots-btn" OnClientClick="togglePaymentMenu('pnlMenu3', event); return false;" ToolTip="Options">
                                    <asp:Image ID="imgDots3" runat="server" ImageUrl="~/Images/admin_icons/more_vert.svg" AlternateText="⋮" />
                                </asp:LinkButton>
                                <asp:Panel ID="pnlMenu3" runat="server" ClientIDMode="Static" CssClass="admin-salon-dropdown-menu" style="display: none; min-width: 160px; right: 0;">
                                    <asp:LinkButton ID="btnDetails3" runat="server" CssClass="admin-dropdown-action" OnClick="btnDetails3_Click">
                                        <asp:Label ID="lblDetText3" runat="server" Text="View Receipt" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnPrint3" runat="server" CssClass="admin-dropdown-action" OnClick="btnPrint3_Click">
                                        <asp:Label ID="lblPrintText3" runat="server" Text="Print Receipt" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnComplete3" runat="server" CssClass="admin-dropdown-action" OnClick="btnComplete3_Click">
                                        <asp:Label ID="lblCompleteText3" runat="server" Text="Mark Completed" />
                                    </asp:LinkButton>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>

                        <%-- Row 4: Keval Patel --%>
                        <asp:Panel ID="pnlPaymentRow4" runat="server" CssClass="admin-payment-row">
                            <asp:Panel ID="pnlCustomer4" runat="server" CssClass="admin-payment-customer">
                                <asp:Image ID="imgCustAvatar4" runat="server" ImageUrl="~/Images/admin_icons/avatar_teal.svg" CssClass="admin-payment-avatar" AlternateText="Keval Patel" />
                                <asp:Label ID="lblCustName4" runat="server" CssClass="admin-payment-customer-name" Text="Keval Patel" />
                            </asp:Panel>
                            <asp:Label ID="lblAmount4" runat="server" CssClass="admin-payment-amount" Text="&#8377;1200" />
                            <asp:Label ID="lblService4" runat="server" CssClass="admin-payment-service" Text="Facial" />
                            <asp:Panel ID="pnlMethod4" runat="server" CssClass="admin-payment-method-box">
                                <asp:Image ID="imgMethod4" runat="server" ImageUrl="~/Images/admin_icons/wallet_card.svg" CssClass="admin-payment-method-icon" AlternateText="Cash" />
                                <asp:Label ID="lblMethod4" runat="server" CssClass="admin-payment-method-text" Text="Cash" />
                            </asp:Panel>
                            <asp:Label ID="lblDate4" runat="server" CssClass="admin-payment-date" Text="7 Aug, 2026" />
                            <asp:Panel ID="pnlMoreWrapper4" runat="server" CssClass="admin-more-menu-container">
                                <asp:LinkButton ID="btnMore4" runat="server" CssClass="admin-more-dots-btn" OnClientClick="togglePaymentMenu('pnlMenu4', event); return false;" ToolTip="Options">
                                    <asp:Image ID="imgDots4" runat="server" ImageUrl="~/Images/admin_icons/more_vert.svg" AlternateText="⋮" />
                                </asp:LinkButton>
                                <asp:Panel ID="pnlMenu4" runat="server" ClientIDMode="Static" CssClass="admin-salon-dropdown-menu" style="display: none; min-width: 160px; right: 0;">
                                    <asp:LinkButton ID="btnDetails4" runat="server" CssClass="admin-dropdown-action" OnClick="btnDetails4_Click">
                                        <asp:Label ID="lblDetText4" runat="server" Text="View Receipt" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnPrint4" runat="server" CssClass="admin-dropdown-action" OnClick="btnPrint4_Click">
                                        <asp:Label ID="lblPrintText4" runat="server" Text="Print Receipt" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnComplete4" runat="server" CssClass="admin-dropdown-action" OnClick="btnComplete4_Click">
                                        <asp:Label ID="lblCompleteText4" runat="server" Text="Mark Completed" />
                                    </asp:LinkButton>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>

                        <%-- Row 5: Om Patel --%>
                        <asp:Panel ID="pnlPaymentRow5" runat="server" CssClass="admin-payment-row">
                            <asp:Panel ID="pnlCustomer5" runat="server" CssClass="admin-payment-customer">
                                <asp:Image ID="imgCustAvatar5" runat="server" ImageUrl="~/Images/admin_icons/avatar_coral.svg" CssClass="admin-payment-avatar" AlternateText="Om Patel" />
                                <asp:Label ID="lblCustName5" runat="server" CssClass="admin-payment-customer-name" Text="Om Patel" />
                            </asp:Panel>
                            <asp:Label ID="lblAmount5" runat="server" CssClass="admin-payment-amount" Text="&#8377;1000" />
                            <asp:Label ID="lblService5" runat="server" CssClass="admin-payment-service" Text="Hair Spa" />
                            <asp:Panel ID="pnlMethod5" runat="server" CssClass="admin-payment-method-box">
                                <asp:Image ID="imgMethod5" runat="server" ImageUrl="~/Images/admin_icons/wallet_card.svg" CssClass="admin-payment-method-icon" AlternateText="Cash" />
                                <asp:Label ID="lblMethod5" runat="server" CssClass="admin-payment-method-text" Text="Cash" />
                            </asp:Panel>
                            <asp:Label ID="lblDate5" runat="server" CssClass="admin-payment-date" Text="12 Aug, 2026" />
                            <asp:Panel ID="pnlMoreWrapper5" runat="server" CssClass="admin-more-menu-container">
                                <asp:LinkButton ID="btnMore5" runat="server" CssClass="admin-more-dots-btn" OnClientClick="togglePaymentMenu('pnlMenu5', event); return false;" ToolTip="Options">
                                    <asp:Image ID="imgDots5" runat="server" ImageUrl="~/Images/admin_icons/more_vert.svg" AlternateText="⋮" />
                                </asp:LinkButton>
                                <asp:Panel ID="pnlMenu5" runat="server" ClientIDMode="Static" CssClass="admin-salon-dropdown-menu" style="display: none; min-width: 160px; right: 0;">
                                    <asp:LinkButton ID="btnDetails5" runat="server" CssClass="admin-dropdown-action" OnClick="btnDetails5_Click">
                                        <asp:Label ID="lblDetText5" runat="server" Text="View Receipt" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnPrint5" runat="server" CssClass="admin-dropdown-action" OnClick="btnPrint5_Click">
                                        <asp:Label ID="lblPrintText5" runat="server" Text="Print Receipt" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnComplete5" runat="server" CssClass="admin-dropdown-action" OnClick="btnComplete5_Click">
                                        <asp:Label ID="lblCompleteText5" runat="server" Text="Mark Completed" />
                                    </asp:LinkButton>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>

                    </asp:Panel>

                </asp:Panel>

            </asp:Panel>

            <%-- Payment Details / Receipt Popup Modal --%>
            <asp:Panel ID="pnlPaymentDetailsModal" runat="server" CssClass="admin-modal-overlay" Visible="false">
                <asp:Panel ID="pnlModalCard" runat="server" CssClass="admin-modal-card">
                    <asp:Panel ID="pnlModalHeader" runat="server" CssClass="admin-modal-header">
                        <asp:Label ID="lblModalTitle" runat="server" CssClass="admin-modal-title" Text="Payment Receipt" />
                        <asp:LinkButton ID="btnCloseX" runat="server" Text="✕" OnClick="btnCloseDetails_Click" style="font-size: 18px; font-weight: bold; color: #555; text-decoration: none; cursor: pointer;" />
                    </asp:Panel>
                    <asp:Panel ID="pnlModalBody" runat="server" CssClass="admin-modal-body">
                        <asp:Panel ID="pnlRowTxnId" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyTxnId" runat="server" CssClass="admin-detail-key" Text="Transaction ID:" />
                            <asp:Label ID="lblValTxnId" runat="server" CssClass="admin-detail-val" style="font-weight: 700; color: #5B2C6F;" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowCustomer" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyCustomer" runat="server" CssClass="admin-detail-key" Text="Customer Name:" />
                            <asp:Label ID="lblValCustomer" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowService" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyService" runat="server" CssClass="admin-detail-key" Text="Service:" />
                            <asp:Label ID="lblValService" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowAmount" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyAmount" runat="server" CssClass="admin-detail-key" Text="Amount Paid:" />
                            <asp:Label ID="lblValAmount" runat="server" CssClass="admin-detail-val" style="font-size: 16px; font-weight: 700; color: #2E7D32;" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowMethod" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyMethod" runat="server" CssClass="admin-detail-key" Text="Payment Method:" />
                            <asp:Label ID="lblValMethod" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowDate" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyDate" runat="server" CssClass="admin-detail-key" Text="Payment Date:" />
                            <asp:Label ID="lblValDate" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowStatus" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyStatus" runat="server" CssClass="admin-detail-key" Text="Payment Status:" />
                            <asp:Label ID="lblValStatus" runat="server" CssClass="admin-detail-val" Text="Completed ✔" style="color: #2E7D32; font-weight: 600;" />
                        </asp:Panel>
                    </asp:Panel>
                    <asp:Panel ID="pnlModalFooter" runat="server" CssClass="admin-modal-footer" style="display: flex; gap: 10px; justify-content: flex-end;">
                        <asp:Button ID="btnPrintReceipt" runat="server" CssClass="btn-admin-submit" Text="Print Receipt" OnClientClick="window.print(); return false;" style="background: #5B2C6F; color: #fff;" />
                        <asp:Button ID="btnCloseModal" runat="server" CssClass="btn-admin-submit" Text="Close" OnClick="btnCloseDetails_Click" style="background: #ECE6DF; color: #333;" />
                    </asp:Panel>
                </asp:Panel>
            </asp:Panel>

        </asp:Panel>
    </form>
</body>
</html>
