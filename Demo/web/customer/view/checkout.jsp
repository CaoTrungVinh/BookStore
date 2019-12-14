<%@ page import="Util.Util" pageEncoding="utf-8" %>
<%@ page import="Model.User" %>
<%@ page import="Model.Cart" %>
<%@ page import="java.util.Map" %>
<%@ page import="Model.BookItem" %>

<!doctype html>
<html class="no-js" lang="">
<head>

    <title>Checkout</title>
    <jsp:include page="../view/head.jsp"/>
    <link rel="stylesheet" href="/public/customer/css/checkout.css">
</head>
<body>

<jsp:include page="../view/header.jsp"/>
<div class="tiki-cart">
    <div class="wrap">
        <div class="container have-height">

            <%
                User user = (User) request.getSession().getAttribute("user");
                Cart cart = null;
                if (user != null) {
                    cart = user.getCart();
                } else {
                    cart = (Cart) request.getSession().getAttribute("cart");
                    user = new User();
                    user.setCart(cart);
                }
                if (cart.getQuantity() != 0) {

            %>
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="lbl-shopping-cart lbl-shopping-cart-gio-hang">Cart <span>(<%=cart.getQuantity()%> <%
                        if (cart.getQuantity() == 1) { %>
                        product
                        <% } else { %>
                        products
                        <%}%>
                        )</span>
                    </h2>
                </div>
                <div class="col-xs-8 cart-col-1">
                    <form id="shopping-cart">
                        <% for (Map.Entry<Integer, BookItem> entry : cart.getData().entrySet()) {
                            BookItem bookItem = entry.getValue();%>
                        <div class="row shopping-cart-item">
                            <div class="col-xs-3 img-thumnail-custom">
                                <p class="image">
                                    <img class="img-responsive"
                                         src="/public/customer/img/shop/<%=bookItem.getImg()%>">
                                </p>
                            </div>
                            <div class="col-right">
                                <div class="box-info-product">
                                    <input type="hidden" class="hidden-quantity" name="quantity[310760531935701]"
                                           value="1">
                                    <div class="badge-tikinow-a">
                                        <p class="name">
                                            <a href="https://tiki.vn/nui-cao-cap-meizan-400g-p1914875.html?src=cart-page&amp;spid=1914877"
                                               target="_blank">
                                                <%=bookItem.getName()%>
                                            </a>

                                        </p>
                                    </div>

                                    <p class="seller-by">
                                        by <span class="firm"><a href=""><%=bookItem.getPublisher()%></a></span>
                                    </p>

                                    <p class="action">
                                        <a>
                                            Xóa
                                        </a>
                                        <a style="margin-left: 3rem">
                                            Để dành mua sau
                                        </a>
                                        <!-- <button type="button" class="btn btn-default btn-custom1 add-to-wishlist" data-product-id="1914877">Đưa vào wishlist</button> -->
                                    </p>
                                </div>
                                <div class="badge-tikinow-a">
                                    <div class="box-price">
                                        <p class="price"><%=bookItem.getPrice()%>đ</p>
                                        <%--                                        <p class="price2">--%>
                                        <%--                                            27.000đ--%>
                                        <%--                                        </p>--%>
                                        <%--                                        <span class="sale">-22%</span>--%>
                                    </div>
                                </div>

                                <div class="quantity-block">
                                    <div class="input-group bootstrap-touchspin"><span class="input-group-btn"><button
                                            class="btn btn-default bootstrap-touchspin-down"
                                            type="button">-</button></span><span
                                            class="input-group-addon bootstrap-touchspin-prefix"
                                            style="display: none;"></span><input type="tel"
                                                                                 class="form-control quantity-r2 quantity js-quantity-product"
                                                                                 min="0"
                                                                                 data-js-qty=""
                                                                                 value="<%=bookItem.getQuantity()%>"
                                                                                 style="display: block;"><span
                                            class="input-group-addon bootstrap-touchspin-postfix"
                                            style="display: none;"></span><span class="input-group-btn"><button
                                            class="btn btn-default bootstrap-touchspin-up"
                                            type="button">+</button></span></div>
                                </div>
                                <!-- <div class="box-info-discount"></div> -->
                            </div>
                        </div>
                        <% } %>
                    </form>
                </div>
                <div class="col-xs-4 cart-col-2">
                    <div id="right-affix" class="affix-top">

                        <div class="each-row">

                            <div class="box-style fee">

                                <p class="list-info-price">
                                    <span>Provisional pricing: </span>
                                    <strong><%=cart.getTotalPrice()%>đ</strong>
                                </p>
                            </div>
                            <div class="box-style fee">
                                <div class="total2 clearfix">
                                    <span class="text-label">Paying money: </span>
                                    <div class="amount">
                                        <p>
                                            <strong><%=cart.getTotalPrice()%>đ </strong>
                                        </p>
                                        <p class="text-right">
                                            <small>(VAT included (where applicable))</small>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <button type="button" class="btn btn-large btn-block btn-danger btn-checkout">
                                Proceed to ordering
                            </button>


                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="panel-group coupon" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title"> CODE OF DISCOUNT / GIFT</h4>
                                        </div>
                                        <div id="collapseOne3" class="panel-collapsex`">
                                            <div class="panel-body">
                                                <div class="input-group">
                                                    <input id="coupon" placeholder="type here.." type="text"
                                                           class="form-control" value="">
                                                    <span class="input-group-btn">
														<button class="btn btn-default btn-coupon"
                                                                type="button">Submit</button>
													</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } else { %>
            <div class="alert alert-danger"><i class="fa fa-times-circle" aria-hidden="true"
                                               style="margin-right: 10px"></i> Cart is empty. Please
                try again.
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h5 class="lbl-shopping-cart lbl-shopping-cart-gio-hang">Cart <span>(0 product)</span></h5>
                    <div class="empty-cart">
                        <!-- <img src="/assets/img/mascot.png"
                             alt="Không có sản phẩm nào trong giỏ hàng của bạn."> -->

                        <span class="mascot-image"></span>
                        <p class="message">Không có sản phẩm nào trong giỏ hàng của bạn.</p>
                        <a href="/" class="btn btn-yellow">Tiếp tục mua sắm</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>
<!-- Footer Area Start -->
<jsp:include page="../view/footer.jsp"/>
<!-- Footer Area End -->
<!-- all js here -->
<!-- jquery latest version -->
<jsp:include page="../view/jquery.jsp"/>
</body>
</html>