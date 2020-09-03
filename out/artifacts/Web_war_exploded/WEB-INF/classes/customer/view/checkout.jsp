<%@ page import="Model.Cart" pageEncoding="utf-8" %>
<%@ page import="Model.Product" %>
<%@ page import="Model.User" %>
<%@ page import="Util.Util" %>
<%@ page import="java.util.Map" %>

<!doctype html>
<html class="no-js" lang="">
<head>

    <title>Checkout</title>
    <jsp:include page="../view/head.jsp"/>
    <link rel="stylesheet" href="/public/customer/css/checkout.css">
    <script src="/public/customer/js/vendor/jquery-1.12.0.min.js"></script>
</head>
<body>

<jsp:include page="../view/header.jsp"/>
<div class="tiki-cart">
    <div class="wrap">
        <div class="container have-height">

            <%
                User user = (User) request.getSession().getAttribute("user");
                boolean isLogin = user != null;
                Cart cart = isLogin ? user.getCart() : (Cart) request.getSession().getAttribute("cart");
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
                <form id="shopping-cart" action="<%=Util.fullPath("cartPay")%>" method="POST">
                    <div class="col-xs-8 cart-col-1">
                        <%--                    <form id="shopping-cart">--%>
                        <% for (Map.Entry<Integer, Product> entry : cart.getData().entrySet()) {
                            Product product = entry.getValue();%>
                        <div class="row shopping-cart-item">
                            <div class="col-xs-3 img-thumnail-custom">
                                <input type='checkbox' class='checkbox' id="checkbox<%=product.getId()%>"
                                       price="<%=product.getTotalPrice()%>"
                                       value="<%=product.getId()%>"
                                       name="payids"
                                       style="float: left;  margin-top: 35%;margin-right: 10px;"/>
                                <p class="image">
                                    <img class="img-responsive"
                                         src="/public/customer/img/shop/images/<%=product.getImg()%>">
                                </p>
                            </div>
                            <div class="col-right">
                                <div class="box-info-product">
                                    <input type="hidden" class="hidden-quantity" name="quantity[310760531935701]"
                                           value="1">
                                    <div class="badge-tikinow-a">
                                        <p class="name">
                                            <a href=""
                                               target="_blank">
                                                <%=product.getTitle()%>
                                            </a>

                                        </p>
                                    </div>

                                    <p class="seller-by">
                                        by <span class="firm"><a href=""><%=product.getPublisher()%></a></span>
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
                                        <p class="price"><%=Util.showPrice(product.getPrice())%>đ</p>
                                    </div>
                                </div>

                                <div class="quantity-block">
                                    <div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
                                        <span
                                                class="input-group-btn input-group-prepend"><button
                                                class="btn btn-primary bootstrap-touchspin-down"
                                                type="button"
                                                onclick="changeQuantityProduct(-1, <%=product.getId()%>)">-</button>
                                        </span>
                                        <input id="touch<%=product.getId()%>" type="number" min="1"
                                               value="<%=product.getQuantity()%>"
                                               name="touchspin"
                                               class="form-control"
                                               style="padding: 0px;width: 28px;text-align: center;">
                                        <span
                                                class="input-group-btn input-group-append"><button
                                                class="btn btn-primary bootstrap-touchspin-up"
                                                type="button"
                                                onclick="changeQuantityProduct(1, <%=product.getId()%>)">+</button>
                                        </span>
                                    </div>
                                </div>
                                <!-- <div class="box-info-discount"></div> -->
                            </div>
                        </div>
                        <% } %>
                        <%--                    --%>
                    </div>
                    <div class="col-xs-4 cart-col-2">
                        <div id="right-affix" class="affix-top">

                            <div class="each-row">

                                <div class="box-style fee">

                                    <p class="list-info-price">
                                        <span>Provisional pricing: </span>
                                        <span id="giatamtinh"><%=Util.showPrice(cart.getTotalPrice())%></span>đ
                                    </p>
                                </div>
                                <div class="box-style fee">
                                    <div class="total2 clearfix">
                                        <span class="text-label">Total payment: </span>
                                        <div class="amount">
                                            <p>
                                                <strong id="thanhtien"><%=Util.showPrice(cart.getTotalPrice())%>
                                                </strong>đ
                                            </p>
                                            <p class="text-right">
                                                <small>(VAT included (where applicable))</small>
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <input type="submit" class="btn btn-large btn-block btn-danger btn-checkout"
                                       value="Proceed to ordering"/>
                            </div>
                        </div>
                    </div>
                </form>
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
                        <span class="mascot-image"></span>
                        <p class="message">You have no items in your shopping cart.</p>
                        <a href="/" class="btn btn-yellow">Continue shopping</a>
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

<script src="/public/customer/js/jquery.bootstrap-touchspin.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        if (!$('input:checkbox.checkbox').is('checked')) {
            $('input:checkbox.checkbox').prop('checked', true);
        } else {
            $('input:checkbox.checkbox').prop('checked', false);
        }
    });
    $(":checkbox").click(function () {
// store the values from the form checkbox box, then send via ajax below
        var check_active = $(this).is(':checked') ? 1 : 0;
        var check_id = $(this).attr('id');
        price = parseInt($(this).attr('value'));

        if (check_active == 1) {
            $("#thanhtien,#giatamtinh").text(showPrice(parseInt(toNumberFromVND($("#thanhtien").text())) + price));
        } else {
            $("#thanhtien,#giatamtinh").text(showPrice(parseInt(toNumberFromVND($("#thanhtien").text())) - price));

        }
    });
    <%--$("#submitorder").click(function () {--%>
    <%--    var ids = [];--%>
    <%--    $.each($("input:checked.checkbox"), function () {--%>
    <%--        ids.push($(this).val());--%>
    <%--    });--%>
    <%--    if (ids.length != 0) {--%>
    <%--        $.post('<%=Util.fullPath("cartPay")%>', ids);--%>
    <%--        console.log("senddd cart pay...")--%>

    <%--    }--%>
    <%--    // href to server--%>
    <%--});--%>


</script>

</body>
</html>