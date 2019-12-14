<%@ page import="Util.Util" pageEncoding="utf-8" %>
<%@ page import="Model.User" %>

<!doctype html>
<html class="no-js" lang="">
<head>

    <title>My Account</title>
    <jsp:include page="../view/head.jsp"/>
    <link rel="stylesheet" href="/public/customer/css/checkout.css">
</head>
<body>

<jsp:include page="../view/header.jsp"/>
<div class="tiki-cart">
    <div class="wrap">
        <div class="container have-height">

            <div class="row">
                <div class="col-xs-12">
                    <h2 class="lbl-shopping-cart lbl-shopping-cart-gio-hang">Giỏ hàng <span>(1 sản phẩm)</span></h2>
                </div>
                <div class="col-xs-8 cart-col-1">
                    <form id="shopping-cart">
                        <div class="row shopping-cart-item">
                            <div class="col-xs-3 img-thumnail-custom">
                                <p class="image">

                                    <img class="img-responsive"
                                         src="https://salt.tikicdn.com/cache/175x175/ts/product/60/a7/a4/c8f71dedf2c4ccd1640186eb1b5c1f8d.jpg">
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
                                                Nui Cao Cấp Meizan (400g) </a>

                                        </p>
                                    </div>
                                    <p class="get-id stock-success" data-js-stock="1914877">
                                        Chỉ còn 4 sản phẩm </p>


                                    <p class="seller-by">
                                        Cung cấp bởi <span class="firm"><a href="">Tiki
												Trading</a></span>
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
                                        <p class="price">21.000đ</p>
                                        <p class="price2">
                                            27.000đ
                                        </p>
                                        <span class="sale">-22%</span>
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
                                                                                 data-js-qty="" value="1"
                                                                                 style="display: block;"><span
                                            class="input-group-addon bootstrap-touchspin-postfix"
                                            style="display: none;"></span><span class="input-group-btn"><button
                                            class="btn btn-default bootstrap-touchspin-up"
                                            type="button">+</button></span></div>
                                </div>
                                <!-- <div class="box-info-discount"></div> -->
                            </div>
                        </div>
                    </form>



                </div>
                <div class="col-xs-4 cart-col-2">
                    <div id="right-affix" class="affix-top">

                        <div class="each-row">

                            <div class="box-style fee">

                                <p class="list-info-price">
                                    <span>Tạm tính: </span>
                                    <strong>21.000đ</strong>
                                </p>
                            </div>
                            <div class="box-style fee">
                                <div class="total2 clearfix">
                                    <span class="text-label">Thành tiền: </span>
                                    <div class="amount">
                                        <p>
                                            <strong>21.000đ </strong>
                                        </p>
                                        <p class="text-right">
                                            <small>(Đã bao gồm VAT nếu có)</small>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <button type="button" class="btn btn-large btn-block btn-danger btn-checkout">Tiến
                                hành đặt hàng
                            </button>


                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="panel-group coupon" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">Mã giảm giá / Quà tặng</h4>
                                        </div>
                                        <div id="collapseOne3" class="panel-collapsex`">
                                            <div class="panel-body">
                                                <div class="input-group">
                                                    <input id="coupon" placeholder="Nhập ở đây.." type="text"
                                                           class="form-control" value="">
                                                    <span class="input-group-btn">
														<button class="btn btn-default btn-coupon" type="button">Đồng
															ý</button>
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