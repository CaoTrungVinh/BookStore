<%@ page import="Util.Util" %>
<!doctype html>
<html class="no-js" lang="">
<head>

    <title>My Account</title>
    <jsp:include page="../view/head.jsp"/>
    <link rel="stylesheet" href="/public/customer/css/my-account.css">
</head>
<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Add your site or application content here -->
<!--Header Area Start-->
<jsp:include page="../view/header.jsp"/>
<div class="tiki-account">
    <div class="wrap">
        <div class="container-full">
            <div class="row-style-1">
                <div class="menu-left">
                    <div class="profiles">
                        <p class="image"><img src="https://salt.tikicdn.com/desktop/img/avatar.png?v=3" height="45"
                                              width="45" alt=""></p>
                        <p class="name">Tài khoản của</p>
                        <h6>Nguyễn Tánh</h6>
                    </div>
                    <div class="menu dropdown">
                        <button class="btn btn-default dropdown-toggle btn-block" type="button" id="dropdownMenu1"
                                data-toggle="dropdown" aria-expanded="true">
                            Danh mục <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li class="active">
                                <a href="<%= Util.fullPath("Account/edit")%>"><i class="fa fa-user"></i><span>Thông tin tài khoản</span>
                                    <!-- <span class='noti-nav'>Mới</span> --></a>
                            </li>
                            <li class="">
                                <a href="<%= Util.fullPath("Account/address") %>"> <i class="fa fa-map-marker-alt"></i>
                                    <span>Sổ địa chỉ</span> </a>
                            </li>
                            <li class="">
                                <a href="<%= Util.fullPath("Account/order") %>"> <i class="fa fa-my-order"></i> <span>Quản lý đơn hàng</span></a>
                            </li>

                            <li class="">
                                <a href="<%= Util.fullPath("Account/wishlist") %>"><i class="fa fa-favorite"></i> <span> Sản phẩm yêu thích</span></a>
                            </li>
                            <!--  -->
                            <!-- <li class="hidden-md hidden-lg">
                <a href="https://tiki.vn/customer/account/logout">Thoát tài khoản</a>
            </li> -->
                        </ul>
                    </div>

                </div>
                <% String route = (String) request.getAttribute("route");
                    if (route.equals("edit")) {
                %>
                <jsp:include page="account.jsp"/>
                <%
                } else if (route.equals("address")) {
                %>
                <jsp:include page="address.jsp"/>
                <%
                } else if (route.equals("add-address")) {
                %>
                <jsp:include page="add-address.jsp"/>
                <%
                } else if (route.equals("order")) {
                %>
                <jsp:include page="order-history.jsp"/>
                <%
                } else if (route.equals("wishlist")) {
                %>
                <jsp:include page="wishlist.jsp"/>

                <%
                } else {
                %>
                <jsp:include page="account.jsp"/>
                <% } %>

            </div>
        </div>
    </div>
</div>
<!-- Loging Area End -->
<!-- Footer Area Start -->
<jsp:include page="../view/footer.jsp"/>
<!-- Footer Area End -->
<!-- all js here -->
<!-- jquery latest version -->
<jsp:include page="../view/jquery.jsp"/>
</body>
</html>