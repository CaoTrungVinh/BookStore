<%@ page import="java.sql.ResultSet" %>
<!doctype html>
<html class="no-js" lang="">
<head>
    <title>Book Store</title>
    <jsp:include page="/customer/view/head.jsp"/>
</head>
<style>
    .star-rating, .back-stars, .front-stars {
        display: flex;
    }

    .star-rating {
        align-items: center;
        font-size: 3em;
        justify-content: center;
        margin-top: 10px;
    }

    .star-rating i {
        font-size: 16px;
        padding: 3px;
    }

    .back-stars {
        color: #5B5B5B;
        position: relative;
        /*text-shadow: 1px 2px 4px #843a3a;*/
    }

    .front-stars {
        color: #32B5F3;
        overflow: hidden;
        position: absolute;
        /*text-shadow: 2px 2px 5px #d29b09;*/
        top: 0;
        transition: all 0.5s;
    }

    .list-pager {
        margin-top: 15px;
        margin-bottom: 0;
        text-align: right
    }

    .list-pager ul {
        list-style: none;
        margin: 0;
        text-align: right;
        padding: 0
    }

    .list-pager ul li .current, .list-pager ul li a.normal {
        display: inline-block;
        margin: 0 5px;
        border-radius: 50%;
        width: 27px;
        height: 27px;
        text-align: center;
        font-size: 12px;
        line-height: 28px
    }

    .list-pager ul li {
        font-weight: 400;
        display: inline-block;
        vertical-align: top
    }

    .list-pager ul li .current {
        font-weight: 400;
        background: #189eff;
        color: #fff
    }

    .list-pager ul li a.normal {
        font-weight: 500;
        background: #f7f7f7;
        color: #333;
        text-decoration: none
    }

    .list-pager ul li a.normal i.fa {
        padding-left: 8px;
        font-size: 20px;
        color: #444
    }

    .list-pager ul li a.normal:hover {
        background: #c1e7ff
    }

    .list-pager ul li a.next, .list-pager ul li a.prev {
        margin: 0 5px;
        color: #393939;
        text-align: center;
        height: 27px;
        width: 27px;
        line-height: 27px;
        background: #fff;
        display: inline-block;
        text-decoration: none
    }

    .list-pager ul li a.prev {
        font-size: 14px;
        border: 1px solid #c6c6c6;
        border-radius: 50%;
        padding: 0 8px 0 6px
    }

    .list-pager ul li a.prev i.fa {
        font-size: 22px;
        vertical-align: middle
    }

    .list-pager ul li a.next {
        font-size: 14px;
        border: 1px solid #c6c6c6;
        border-radius: 50%;
        padding: 0 6px 0 8px
    }

    .list-pager ul li a.next i.fa {
        font-size: 22px;
        vertical-align: middle
    }

    .icon-center i {
        padding-bottom: 4px !important;
    }
</style>
<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Add your site or application content here -->
<!--Header Area Start-->

<jsp:include page="/customer/view/header.jsp"/>
<!--Header Area End-->
<!-- Mobile Menu Start -->
<!-- Mobile Menu End -->
<!-- slider Area Start -->
<div class="slider-area">
    <div class="bend niceties preview-1">
        <div id="ensign-nivoslider" class="slides">
            <img src="public/customer/img/slider/1.jpg" alt="" title="#slider-direction-1"/>
            <img src="public/customer/img/slider/2.jpg" alt="" title="#slider-direction-2"/>
        </div>
        <!-- direction 1 -->
        <div id="slider-direction-1" class="text-center slider-direction">
            <!-- layer 1 -->
            <div class="layer-1">
                <h2 class="title-1">LET'S NANAME BOOK IMAGINE</h2>
            </div>
            <!-- layer 2 -->
            <div class="layer-2">
                <p class="title-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                    incididunt ut labore et dolore magna aliqua.</p>
            </div>
            <!-- layer 3 -->
            <div class="layer-3">
                <a href="#" class="title-3">SEE MORE</a>
            </div>
        </div>
        <!-- direction 2 -->
        <div id="slider-direction-2" class="slider-direction">
            <!-- layer 1 -->
            <div class="layer-1">
                <h2 class="title-1">LET'S NANAME BOOK IMAGINE</h2>
            </div>
            <!-- layer 2 -->
            <div class="layer-2">
                <p class="title-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                    incididunt ut labore et dolore magna aliqua.</p>
            </div>
            <!-- layer 3 -->
            <div class="layer-3">
                <a href="#" class="title-3">SEE MORE</a>
            </div>
        </div>
    </div>
</div>
<!-- slider Area End-->
<!-- Online Banner Area Start -->
<div class="online-banner-area">
    <div class="container">
        <div class="banner-title text-center">
            <h2>ONLINE <span>BOOK STORE</span></h2>
            <p>The Online Books Guide is the biggest big store and the biggest books library in the world that has alot
                of the popular and the most top category books presented here. Top Authors are here just subscribe your
                email address and get updated with us.</p>
        </div>
        <div class="row">
            <div class="banner-list">
                <div class="col-md-4 col-sm-6">
                    <div class="single-banner">
                        <a href="#">
                            <img src="public/customer/img/banner/1.jpg" alt="">
                        </a>
<%--                        <div class="price"><span>$</span>160</div>--%>
                        <div class="banner-bottom text-center">
                            <a href="#">NEW RELEASE 2020</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="single-banner">
                        <a href="#">
                            <img src="public/customer/img/banner/2.jpg" alt="">
                        </a>
<%--                        <div class="price"><span>$</span>160</div>--%>
                        <div class="banner-bottom text-center">
                            <a href="#">NEW RELEASE 2020</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 hidden-sm">
                    <div class="single-banner">
                        <a href="#">
                            <img src="public/customer/img/banner/3.jpg" alt="">
                        </a>
<%--                        <div class="price"><span>$</span>160</div>--%>
                        <div class="banner-bottom text-center">
                            <a href="#">NEW RELEASE 2020</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Online Banner Area End -->
<!-- Shop Info Area Start -->
<div class="shop-info-area">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="single-shop-info">
                    <div class="shop-info-icon">
                        <i class="flaticon-transport"></i>
                    </div>
                    <div class="shop-info-content">
                        <h2>FREE SHIPPING</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. </p>
                        <a href="#">READ MORE</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="single-shop-info">
                    <div class="shop-info-icon">
                        <i class="flaticon-money"></i>
                    </div>
                    <div class="shop-info-content">
                        <h2>FREE SHIPPING</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. </p>
                        <a href="#">READ MORE</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 hidden-sm">
                <div class="single-shop-info">
                    <div class="shop-info-icon">
                        <i class="flaticon-school"></i>
                    </div>
                    <div class="shop-info-content">
                        <h2>FREE SHIPPING</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. </p>
                        <a href="#">READ MORE</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Shop Info Area End -->
<!-- Featured Product Area Start -->
<div class="featured-product-area section-padding">
    <h2 class="section-title">FEATURED PRODUCTS</h2>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="tab-menu">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="first-item active">
                            <a href="#arrival" aria-controls="arrival" role="tab" data-toggle="tab">New Arrival</a>
                        </li>
                        <li role="presentation">
                            <a href="#sale" aria-controls="sale" role="tab" data-toggle="tab">BEST SELLERS</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="product-list tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="arrival">
                    <div class="featured-product-list indicator-style">
                        <%
                            ResultSet rs = (ResultSet) request.getAttribute("rs");
                            while (rs.next()) {
                        %>
                        <div class="single-p-banner">
                            <div class="col-md-3">
                                <div class="single-banner">
                                    <div class="product-wrapper">
                                        <a href="#" class="single-banner-image-wrapper">
                                            <img alt="" src="/public/customer/img/shop/<%= rs.getString(4)%>" style="padding-top: 30px">
                                            <div class="price"><span><%= rs.getInt(3)%> VND</span></div>
<%--                                            <div class="rating-icon">--%>
<%--                                                <i class="fa fa-star icolor"></i>--%>
<%--                                                <i class="fa fa-star icolor"></i>--%>
<%--                                                <i class="fa fa-star icolor"></i>--%>
<%--                                                <i class="fa fa-star"></i>--%>
<%--                                                <i class="fa fa-star"></i>--%>
<%--                                            </div>--%>
                                            <div class="star-rating">
                                                <div class="back-stars">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>

                                                    <div class="front-stars" style="width: <%= rs.getInt(6)%>%">
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <div class="product-description">
                                            <div class="functional-buttons">
                                                <a href="#" title="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                                <a href="#" title="Add to Wishlist">
                                                    <i class="fa fa-heart-o"></i>
                                                </a>
                                                <a href="#" title="Quick view" data-toggle="modal"
                                                   data-target="#productModal">
                                                    <i class="fa fa-compress"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="banner-bottom text-center" style="height: 100px">
                                        <a href="#"><%= rs.getString(2)%></a>
                                    </div>
                                </div>
                            </div>
<%--                            <div class="col-md-3">--%>
<%--                                <div class="single-banner">--%>
<%--                                    <div class="product-wrapper">--%>
<%--                                        <a href="#" class="single-banner-image-wrapper">--%>
<%--                                            <img alt="" src="public/customer/img/featured/5.jpg">--%>
<%--                                            <div class="price"><span>$</span>160</div>--%>
<%--                                            <div class="rating-icon">--%>
<%--                                                <i class="fa fa-star icolor"></i>--%>
<%--                                                <i class="fa fa-star icolor"></i>--%>
<%--                                                <i class="fa fa-star icolor"></i>--%>
<%--                                                <i class="fa fa-star"></i>--%>
<%--                                                <i class="fa fa-star"></i>--%>
<%--                                            </div>--%>
<%--                                        </a>--%>
<%--                                        <div class="product-description">--%>
<%--                                            <div class="functional-buttons">--%>
<%--                                                <a href="#" title="Add to Cart">--%>
<%--                                                    <i class="fa fa-shopping-cart"></i>--%>
<%--                                                </a>--%>
<%--                                                <a href="#" title="Add to Wishlist">--%>
<%--                                                    <i class="fa fa-heart-o"></i>--%>
<%--                                                </a>--%>
<%--                                                <a href="#" title="Quick view" data-toggle="modal"--%>
<%--                                                   data-target="#productModal">--%>
<%--                                                    <i class="fa fa-compress"></i>--%>
<%--                                                </a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="banner-bottom text-center">--%>
<%--                                        <a href="#">The historian</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </div>
                        <% } %>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="sale">
                    <div class="featured-product-list indicator-style">
                        <div class="single-p-banner">
                            <div class="col-md-3">
                                <div class="single-banner">
                                    <div class="product-wrapper">
                                        <a href="#" class="single-banner-image-wrapper">
                                            <img alt="" src="public/customer/img/featured/2.jpg">
                                            <div class="price"><span>$</span>160</div>
                                            <div class="rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </a>
                                        <div class="product-description">
                                            <div class="functional-buttons">
                                                <a href="#" title="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                                <a href="#" title="Add to Wishlist">
                                                    <i class="fa fa-heart-o"></i>
                                                </a>
                                                <a href="#" title="Quick view" data-toggle="modal"
                                                   data-target="#productModal">
                                                    <i class="fa fa-compress"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="banner-bottom text-center">
                                        <a href="#">People of the book</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="single-banner">
                                    <div class="product-wrapper">
                                        <a href="#" class="single-banner-image-wrapper">
                                            <img alt="" src="public/customer/img/featured/6.jpg">
                                            <div class="price"><span>$</span>160</div>
                                            <div class="rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </a>
                                        <div class="product-description">
                                            <div class="functional-buttons">
                                                <a href="#" title="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                                <a href="#" title="Add to Wishlist">
                                                    <i class="fa fa-heart-o"></i>
                                                </a>
                                                <a href="#" title="Quick view" data-toggle="modal"
                                                   data-target="#productModal">
                                                    <i class="fa fa-compress"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="banner-bottom text-center">
                                        <a href="#">Cold mountain</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single-p-banner">
                            <div class="col-md-3">
                                <div class="single-banner">
                                    <div class="product-wrapper">
                                        <a href="#" class="single-banner-image-wrapper">
                                            <img alt="" src="public/customer/img/featured/3.jpg">
                                            <div class="price"><span>$</span>160</div>
                                            <div class="rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </a>
                                        <div class="product-description">
                                            <div class="functional-buttons">
                                                <a href="#" title="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                                <a href="#" title="Add to Wishlist">
                                                    <i class="fa fa-heart-o"></i>
                                                </a>
                                                <a href="#" title="Quick view" data-toggle="modal"
                                                   data-target="#productModal">
                                                    <i class="fa fa-compress"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="banner-bottom text-center">
                                        <a href="#">The secret letter</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="single-banner">
                                    <div class="product-wrapper">
                                        <a href="#" class="single-banner-image-wrapper">
                                            <img alt="" src="public/customer/img/featured/7.jpg">
                                            <div class="price"><span>$</span>160</div>
                                            <div class="rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </a>
                                        <div class="product-description">
                                            <div class="functional-buttons">
                                                <a href="#" title="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                                <a href="#" title="Add to Wishlist">
                                                    <i class="fa fa-heart-o"></i>
                                                </a>
                                                <a href="#" title="Quick view" data-toggle="modal"
                                                   data-target="#productModal">
                                                    <i class="fa fa-compress"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="banner-bottom text-center">
                                        <a href="#">The historian</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single-p-banner">
                            <div class="col-md-3">
                                <div class="single-banner">
                                    <div class="product-wrapper">
                                        <a href="#" class="single-banner-image-wrapper">
                                            <img alt="" src="public/customer/img/featured/4.jpg">
                                            <div class="price"><span>$</span>160</div>
                                            <div class="rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </a>
                                        <div class="product-description">
                                            <div class="functional-buttons">
                                                <a href="#" title="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                                <a href="#" title="Add to Wishlist">
                                                    <i class="fa fa-heart-o"></i>
                                                </a>
                                                <a href="#" title="Quick view" data-toggle="modal"
                                                   data-target="#productModal">
                                                    <i class="fa fa-compress"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="banner-bottom text-center">
                                        <a href="#">Lone some dove</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="single-banner">
                                    <div class="product-wrapper">
                                        <a href="#" class="single-banner-image-wrapper">
                                            <img alt="" src="public/customer/img/featured/8.jpg">
                                            <div class="price"><span>$</span>160</div>
                                            <div class="rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </a>
                                        <div class="product-description">
                                            <div class="functional-buttons">
                                                <a href="#" title="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                                <a href="#" title="Add to Wishlist">
                                                    <i class="fa fa-heart-o"></i>
                                                </a>
                                                <a href="#" title="Quick view" data-toggle="modal"
                                                   data-target="#productModal">
                                                    <i class="fa fa-compress"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="banner-bottom text-center">
                                        <a href="#">The secret garden</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single-p-banner">
                            <div class="col-md-3">
                                <div class="single-banner">
                                    <div class="product-wrapper">
                                        <a href="#" class="single-banner-image-wrapper">
                                            <img alt="" src="public/customer/img/featured/1.jpg">
                                            <div class="price"><span>$</span>160</div>
                                            <div class="rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </a>
                                        <div class="product-description">
                                            <div class="functional-buttons">
                                                <a href="#" title="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                                <a href="#" title="Add to Wishlist">
                                                    <i class="fa fa-heart-o"></i>
                                                </a>
                                                <a href="#" title="Quick view" data-toggle="modal"
                                                   data-target="#productModal">
                                                    <i class="fa fa-compress"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="banner-bottom text-center">
                                        <a href="#">East of eden</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="single-banner">
                                    <div class="product-wrapper">
                                        <a href="#" class="single-banner-image-wrapper">
                                            <img alt="" src="public/customer/img/featured/5.jpg">
                                            <div class="price"><span>$</span>160</div>
                                            <div class="rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </a>
                                        <div class="product-description">
                                            <div class="functional-buttons">
                                                <a href="#" title="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                                <a href="#" title="Add to Wishlist">
                                                    <i class="fa fa-heart-o"></i>
                                                </a>
                                                <a href="#" title="Quick view" data-toggle="modal"
                                                   data-target="#productModal">
                                                    <i class="fa fa-compress"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="banner-bottom text-center">
                                        <a href="#">The historian</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single-p-banner">
                            <div class="col-md-3">
                                <div class="single-banner">
                                    <div class="product-wrapper">
                                        <a href="#" class="single-banner-image-wrapper">
                                            <img alt="" src="public/customer/img/featured/1.jpg">
                                            <div class="price"><span>$</span>160</div>
                                            <div class="rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </a>
                                        <div class="product-description">
                                            <div class="functional-buttons">
                                                <a href="#" title="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                                <a href="#" title="Add to Wishlist">
                                                    <i class="fa fa-heart-o"></i>
                                                </a>
                                                <a href="#" title="Quick view" data-toggle="modal"
                                                   data-target="#productModal">
                                                    <i class="fa fa-compress"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="banner-bottom text-center">
                                        <a href="#">East of eden</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="single-banner">
                                    <div class="product-wrapper">
                                        <a href="#" class="single-banner-image-wrapper">
                                            <img alt="" src="public/customer/img/featured/5.jpg">
                                            <div class="price"><span>$</span>160</div>
                                            <div class="rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>

                                        </a>
                                        <div class="product-description">
                                            <div class="functional-buttons">
                                                <a href="#" title="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                                <a href="#" title="Add to Wishlist">
                                                    <i class="fa fa-heart-o"></i>
                                                </a>
                                                <a href="#" title="Quick view" data-toggle="modal"
                                                   data-target="#productModal">
                                                    <i class="fa fa-compress"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="banner-bottom text-center">
                                        <a href="#">The historian</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single-p-banner">
                            <div class="col-md-3">
                                <div class="single-banner">
                                    <div class="product-wrapper">
                                        <a href="#" class="single-banner-image-wrapper">
                                            <img alt="" src="public/customer/img/featured/4.jpg">
                                            <div class="price"><span>$</span>160</div>
                                            <div class="rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </a>
                                        <div class="product-description">
                                            <div class="functional-buttons">
                                                <a href="#" title="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                                <a href="#" title="Add to Wishlist">
                                                    <i class="fa fa-heart-o"></i>
                                                </a>
                                                <a href="#" title="Quick view" data-toggle="modal"
                                                   data-target="#productModal">
                                                    <i class="fa fa-compress"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="banner-bottom text-center">
                                        <a href="#">East of eden</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="single-banner">
                                    <div class="product-wrapper">
                                        <a href="#" class="single-banner-image-wrapper">
                                            <img alt="" src="public/customer/img/featured/8.jpg">
                                            <div class="price"><span>$</span>160</div>
                                            <div class="rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </a>
                                        <div class="product-description">
                                            <div class="functional-buttons">
                                                <a href="#" title="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                                <a href="#" title="Add to Wishlist">
                                                    <i class="fa fa-heart-o"></i>
                                                </a>
                                                <a href="#" title="Quick view" data-toggle="modal"
                                                   data-target="#productModal">
                                                    <i class="fa fa-compress"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="banner-bottom text-center">
                                        <a href="#">The historian</a>
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
<!-- Featured Product Area End -->
<!-- Testimonial Area Start -->
<div class="testimonial-area text-center">
    <div class="container">
        <div class="testimonial-title">
            <h2>OUR TESTIMONIAL</h2>
            <p>What our clients say about the books reviews and comments</p>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="testimonial-list">
                    <div class="single-testimonial">
                        <img src="public/customer/img/testimonial/1.jpg" alt="">
                        <div class="testmonial-info clearfix">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation. </p>
                            <div class="testimonial-author text-center">
                                <h3>JOHN DOE</h3>
                                <p>The Author</p>
                            </div>
                        </div>
                    </div>
                    <div class="single-testimonial">
                        <img src="public/customer/img/testimonial/2.jpg" alt="">
                        <div class="testmonial-info clearfix">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation. </p>
                            <div class="testimonial-author text-center">
                                <h3>Ashim Kumar</h3>
                                <p>CEO</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Testimonial Area End -->
<!-- Counter Area Start -->
<div class="counter-area section-padding text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-6">
                <div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
                    <div class="counter-info">
								<span class="fcount">
									<span class="counter">3725</span>
								</span>
                        <h3>BOOKS READ</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-6">
                <div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
                    <div class="counter-info">
								<span class="fcount">
									<span class="counter">950</span>
								</span>
                        <h3>ONLINE USERS</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-6">
                <div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
                    <div class="counter-info">
								<span class="fcount">
									<span class="counter">1450</span>
								</span>
                        <h3>BEST AUTHORS</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-6">
                <div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
                    <div class="counter-info">
								<span class="fcount">
									<span class="counter">62</span>
								</span>
                        <h3>AWARDS</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Counter Area End -->
<!-- Blog Area Start -->
<div class="blog-area section-padding">
    <h2 class="section-title">LATEST BLOG</h2>
    <p>The Latest Blog post for the biggest Blog for the books Library.</p>
    <div class="container">
        <div class="row">
            <div class="blog-list indicator-style">
                <%
                    ResultSet book = (ResultSet) request.getAttribute("book");
                    while (book.next()) {
                %>
                <div class="col-md-3">
                    <div class="single-blog">
                        <a href="single-#">
                            <img src="/public/customer/img/shop/<%= book.getString(4)%>" width="270px" height="200px" alt="">
                        </a>
                        <div class="blog-info text-center">
                            <a href="#"><h2>Modern Book Reviews</h2></a>
                            <div class="blog-info-bottom">
                                <span class="blog-author">BY: <a href="#">LATEST BLOG</a></span>
                                <span class="blog-date">19TH JAN 2016</span>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>
<!-- Blog Area End -->
<!-- News Letter Area Start -->
<div class="newsletter-area text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="newsletter-title">
                    <h2>SUBSCRIBE OUR NEWSLETTER</h2>
                    <p>Subscribe here with your email us and get up to date.</p>
                </div>
                <div class="letter-box">
                    <form action="#" method="post" class="search-box">
                        <div>
                            <input type="text" placeholder="Subscribe us">
                            <button type="submit" class="btn btn-search">SUBSCRIBE<span><i
                                    class="flaticon-school-1"></i></span></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- News Letter Area End -->
<!-- Footer Area Start -->

<jsp:include page="/customer/view/footer.jsp"/>
<!-- Footer Area End -->
<!--Quickview Product Start -->
<div id="quickview-wrapper">
    <!-- Modal -->
    <div class="modal fade" id="productModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="modal-product">
                        <div class="product-images">
                            <div class="main-image images">
                                <img alt="" src="public/customer/img/quick-view.jpg">
                            </div>
                        </div>
                        <div class="product-info">
                            <h1>Frame Princes Cut Diamond</h1>
                            <div class="price-box">
                                <p class="s-price"><span class="special-price"><span
                                        class="amount">$280.00</span></span></p>
                            </div>
                            <a href="product-details.jsp" class="see-all">See all features</a>
                            <div class="quick-add-to-cart">
                                <form method="post" class="cart">
                                    <div class="numbers-row">
                                        <input type="number" id="french-hens" value="3">
                                    </div>
                                    <button class="single_add_to_cart_button" type="submit">Add to cart</button>
                                </form>
                            </div>
                            <div class="quick-desc">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est
                                tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis
                                justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id
                                nulla.
                            </div>
                            <div class="social-sharing">
                                <div class="widget widget_socialsharing_widget">
                                    <h3 class="widget-title-modal">Share this product</h3>
                                    <ul class="social-icons">
                                        <li><a target="_blank" title="Facebook" href="#" class="facebook social-icon"><i
                                                class="fa fa-facebook"></i></a></li>
                                        <li><a target="_blank" title="Twitter" href="#" class="twitter social-icon"><i
                                                class="fa fa-twitter"></i></a></li>
                                        <li><a target="_blank" title="Pinterest" href="#" class="pinterest social-icon"><i
                                                class="fa fa-pinterest"></i></a></li>
                                        <li><a target="_blank" title="Google +" href="#" class="gplus social-icon"><i
                                                class="fa fa-google-plus"></i></a></li>
                                        <li><a target="_blank" title="LinkedIn" href="#" class="linkedin social-icon"><i
                                                class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div><!-- .product-info -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End of Quickview Product-->
<!-- all js here -->
<!-- jquery latest version -->

<jsp:include page="/customer/view/jquery.jsp"/>
</body>
</html>