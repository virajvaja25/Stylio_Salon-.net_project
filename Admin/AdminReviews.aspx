<%@ Page Title="Stylio | Admin Reviews" Language="C#" AutoEventWireup="true" CodeBehind="AdminReviews.aspx.cs" Inherits="Stylio_Salon.AdminReviews" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Reviews</title>
    <link rel="stylesheet" type="text/css" href="../Styles/Admin.css" />
</head>
<body>
    <form id="frmAdminReviews" runat="server">
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

                    <asp:HyperLink ID="lnkNavBookings" runat="server" NavigateUrl="#" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavBookings" runat="server" ImageUrl="~/Images/admin_icons/bookings.svg" CssClass="admin-nav-svg-icon" AlternateText="Bookings" />
                        <asp:Label ID="lblTextBookings" runat="server" CssClass="admin-nav-text" Text="Bookings" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavServices" runat="server" NavigateUrl="~/Admin/AdminAddService.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavServices" runat="server" ImageUrl="~/Images/admin_icons/services.svg" CssClass="admin-nav-svg-icon" AlternateText="Services" />
                        <asp:Label ID="lblTextServices" runat="server" CssClass="admin-nav-text" Text="Services" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavReviews" runat="server" NavigateUrl="~/Admin/AdminReviews.aspx" CssClass="admin-nav-item admin-nav-item-active">
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
                    
                    <asp:Label ID="lblPageTitle" runat="server" CssClass="admin-page-title" Text="Reviwes" />

                    <%-- Search Reviews Box --%>
                    <asp:Panel ID="pnlReviewsSearchBox" runat="server" CssClass="admin-section-search-wrapper">
                        <asp:Image ID="imgSearchReviewsIcon" runat="server" ImageUrl="~/Images/admin_icons/search.svg" CssClass="admin-section-search-icon" AlternateText="Search" />
                        <asp:TextBox ID="txtSearchReviews" runat="server" CssClass="admin-section-search-input" placeholder="Search Reviews..." AutoPostBack="true" OnTextChanged="txtSearchReviews_TextChanged" />
                    </asp:Panel>

                    <%-- Reviews List Card --%>
                    <asp:Panel ID="pnlReviewsCard" runat="server" CssClass="admin-reviews-card">
                        
                        <%-- Review 1: Viraj Vaja --%>
                        <asp:Panel ID="pnlReviewRow1" runat="server" CssClass="admin-review-row">
                            <asp:Panel ID="pnlReviewUser1" runat="server" CssClass="admin-review-user-box">
                                <asp:Image ID="imgAvatar1" runat="server" ImageUrl="~/Images/admin_icons/avatar_coral.svg" CssClass="admin-review-avatar" AlternateText="Viraj Vaja" />
                                <asp:Panel ID="pnlUserInfo1" runat="server" CssClass="admin-review-user-info">
                                    <asp:Label ID="lblUserName1" runat="server" CssClass="admin-review-user-name" Text="Viraj Vaja" />
                                    <asp:Label ID="lblSalonName1" runat="server" CssClass="admin-review-salon-name" Text="The Hair Studio" />
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel ID="pnlReviewComment1" runat="server" CssClass="admin-review-comment-box">
                                <asp:Panel ID="pnlStars1" runat="server" CssClass="admin-review-stars-row">
                                    <asp:Image ID="imgStar1_1" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar1_2" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar1_3" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar1_4" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar1_5" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Label ID="lblScore1" runat="server" CssClass="admin-review-score" Text="5.0" />
                                </asp:Panel>
                                <asp:Label ID="lblText1" runat="server" CssClass="admin-review-text" Text="Great Experience! Very Professional! Staff and Clean Enviernment." />
                            </asp:Panel>
                            <asp:Label ID="lblDate1" runat="server" CssClass="admin-review-date" Text="08 Aug-2026" />
                            <asp:Panel ID="pnlStatus1" runat="server">
                                <asp:Label ID="lblStatus1" runat="server" CssClass="admin-status-approved" Text="Approved" />
                            </asp:Panel>
                        </asp:Panel>

                        <%-- Review 2: Khush Patel --%>
                        <asp:Panel ID="pnlReviewRow2" runat="server" CssClass="admin-review-row">
                            <asp:Panel ID="pnlReviewUser2" runat="server" CssClass="admin-review-user-box">
                                <asp:Image ID="imgAvatar2" runat="server" ImageUrl="~/Images/admin_icons/avatar_teal.svg" CssClass="admin-review-avatar" AlternateText="Khush Patel" />
                                <asp:Panel ID="pnlUserInfo2" runat="server" CssClass="admin-review-user-info">
                                    <asp:Label ID="lblUserName2" runat="server" CssClass="admin-review-user-name" Text="Khush Patel" />
                                    <asp:Label ID="lblSalonName2" runat="server" CssClass="admin-review-salon-name" Text="The Hair Studio" />
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel ID="pnlReviewComment2" runat="server" CssClass="admin-review-comment-box">
                                <asp:Panel ID="pnlStars2" runat="server" CssClass="admin-review-stars-row">
                                    <asp:Image ID="imgStar2_1" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar2_2" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar2_3" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar2_4" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar2_5" runat="server" ImageUrl="~/Images/admin_icons/star_half.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Label ID="lblScore2" runat="server" CssClass="admin-review-score" Text="4.5" />
                                </asp:Panel>
                                <asp:Label ID="lblText2" runat="server" CssClass="admin-review-text" Text="Loved The Haircut and Service, Highly Recommended!" />
                            </asp:Panel>
                            <asp:Label ID="lblDate2" runat="server" CssClass="admin-review-date" Text="07 Aug-2026" />
                            <asp:Panel ID="pnlStatus2" runat="server">
                                <asp:Label ID="lblStatus2" runat="server" CssClass="admin-status-approved" Text="Approved" />
                            </asp:Panel>
                        </asp:Panel>

                        <%-- Review 3: Meet Patel --%>
                        <asp:Panel ID="pnlReviewRow3" runat="server" CssClass="admin-review-row">
                            <asp:Panel ID="pnlReviewUser3" runat="server" CssClass="admin-review-user-box">
                                <asp:Image ID="imgAvatar3" runat="server" ImageUrl="~/Images/admin_icons/avatar_coral.svg" CssClass="admin-review-avatar" AlternateText="Meet Patel" />
                                <asp:Panel ID="pnlUserInfo3" runat="server" CssClass="admin-review-user-info">
                                    <asp:Label ID="lblUserName3" runat="server" CssClass="admin-review-user-name" Text="Meet Patel" />
                                    <asp:Label ID="lblSalonName3" runat="server" CssClass="admin-review-salon-name" Text="Stylio Men's Salon" />
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel ID="pnlReviewComment3" runat="server" CssClass="admin-review-comment-box">
                                <asp:Panel ID="pnlStars3" runat="server" CssClass="admin-review-stars-row">
                                    <asp:Image ID="imgStar3_1" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar3_2" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar3_3" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar3_4" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Label ID="lblScore3" runat="server" CssClass="admin-review-score" Text="4.0" />
                                </asp:Panel>
                                <asp:Label ID="lblText3" runat="server" CssClass="admin-review-text" Text="Best Salon in Town! Will visit Again." />
                            </asp:Panel>
                            <asp:Label ID="lblDate3" runat="server" CssClass="admin-review-date" Text="06 Aug-2026" />
                            <asp:Panel ID="pnlStatus3" runat="server">
                                <asp:Label ID="lblStatus3" runat="server" CssClass="admin-status-approved" Text="Approved" />
                            </asp:Panel>
                        </asp:Panel>

                        <%-- Review 4: Dev Patel --%>
                        <asp:Panel ID="pnlReviewRow4" runat="server" CssClass="admin-review-row">
                            <asp:Panel ID="pnlReviewUser4" runat="server" CssClass="admin-review-user-box">
                                <asp:Image ID="imgAvatar4" runat="server" ImageUrl="~/Images/admin_icons/avatar_teal.svg" CssClass="admin-review-avatar" AlternateText="Dev Patel" />
                                <asp:Panel ID="pnlUserInfo4" runat="server" CssClass="admin-review-user-info">
                                    <asp:Label ID="lblUserName4" runat="server" CssClass="admin-review-user-name" Text="Dev Patel" />
                                    <asp:Label ID="lblSalonName4" runat="server" CssClass="admin-review-salon-name" Text="Stylio Men's Salon" />
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel ID="pnlReviewComment4" runat="server" CssClass="admin-review-comment-box">
                                <asp:Panel ID="pnlStars4" runat="server" CssClass="admin-review-stars-row">
                                    <asp:Image ID="imgStar4_1" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar4_2" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar4_3" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar4_4" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Label ID="lblScore4" runat="server" CssClass="admin-review-score" Text="4.0" />
                                </asp:Panel>
                                <asp:Label ID="lblText4" runat="server" CssClass="admin-review-text" Text="Amazing service! Highly recommended! Clean environment and very professional staff." />
                            </asp:Panel>
                            <asp:Label ID="lblDate4" runat="server" CssClass="admin-review-date" Text="05 Aug-2026" />
                            <asp:Panel ID="pnlStatus4" runat="server">
                                <asp:Label ID="lblStatus4" runat="server" CssClass="admin-status-approved" Text="Approved" />
                            </asp:Panel>
                        </asp:Panel>

                        <%-- Review 5: Om Patel --%>
                        <asp:Panel ID="pnlReviewRow5" runat="server" CssClass="admin-review-row">
                            <asp:Panel ID="pnlReviewUser5" runat="server" CssClass="admin-review-user-box">
                                <asp:Image ID="imgAvatar5" runat="server" ImageUrl="~/Images/admin_icons/avatar_coral.svg" CssClass="admin-review-avatar" AlternateText="Om Patel" />
                                <asp:Panel ID="pnlUserInfo5" runat="server" CssClass="admin-review-user-info">
                                    <asp:Label ID="lblUserName5" runat="server" CssClass="admin-review-user-name" Text="Om Patel" />
                                    <asp:Label ID="lblSalonName5" runat="server" CssClass="admin-review-salon-name" Text="The Mae Man Salon" />
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel ID="pnlReviewComment5" runat="server" CssClass="admin-review-comment-box">
                                <asp:Panel ID="pnlStars5" runat="server" CssClass="admin-review-stars-row">
                                    <asp:Image ID="imgStar5_1" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar5_2" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar5_3" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar5_4" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Image ID="imgStar5_5" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Label ID="lblScore5" runat="server" CssClass="admin-review-score" Text="5.0" />
                                </asp:Panel>
                                <asp:Label ID="lblText5" runat="server" CssClass="admin-review-text" Text="Excellent service! Very satisfied. Will visit again!" />
                            </asp:Panel>
                            <asp:Label ID="lblDate5" runat="server" CssClass="admin-review-date" Text="04 Aug-2026" />
                            <asp:Panel ID="pnlStatus5" runat="server">
                                <asp:Label ID="lblStatus5" runat="server" CssClass="admin-status-approved" Text="Approved" />
                            </asp:Panel>
                        </asp:Panel>

                        <%-- Pagination Bar --%>
                        <asp:Panel ID="pnlPagination" runat="server" CssClass="admin-pagination-row">
                            <asp:Label ID="lblPaginationInfo" runat="server" CssClass="admin-pagination-info" Text="Showing 1 to 5 of 820 users" />
                            <asp:Panel ID="pnlPageControls" runat="server" CssClass="admin-pagination-controls">
                                <asp:LinkButton ID="btnPrevPage" runat="server" CssClass="admin-page-btn" Text="&lt;" ToolTip="Previous" />
                                <asp:LinkButton ID="btnPage1" runat="server" CssClass="admin-page-btn admin-page-btn-active" Text="1" />
                                <asp:LinkButton ID="btnPage2" runat="server" CssClass="admin-page-btn" Text="2" />
                                <asp:Label ID="lblEllipsis" runat="server" CssClass="admin-page-ellipsis" Text="..." />
                                <asp:LinkButton ID="btnPage160" runat="server" CssClass="admin-page-btn" Text="160" />
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
