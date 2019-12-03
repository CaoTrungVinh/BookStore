<%@ page import="java.sql.ResultSet" %>
<%@ page import="Util.Util" %>
<%@ page import="javax.swing.*" %>
<!doctype html>
<html class="no-js" lang="">
<head>
    <title>Shop || Witter Multipage Responsive Template</title>

    <jsp:include page="head.jsp"/>
</head>
<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Add your site or application content here -->
<!--Header Area Start-->
<jsp:include page="header.jsp"/>
<!--Header Area End-->
<!-- Mobile Menu Start -->
<!-- Mobile Menu End -->
<!-- Breadcrumbs Area Start -->
<div class="breadcrumbs-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="breadcrumbs">
                    <h2>SHOP LEFT SIDEBAR</h2>
                    <ul class="breadcrumbs-list">
                        <li>
                            <a title="Return to Home" href="../../index.jsp">Home</a>
                        </li>
                        <li>SHOP LEFT SIDEBAR</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs Area Start -->
<!-- Shop Area Start -->
<div class="shopping-area section-padding">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-12">
                <div class="shop-widget">
                    <div class="shop-widget-top">
                        <aside class="widget widget-categories">
                            <h2 class="sidebar-title text-center">CATEGORY</h2>
                            <ul class="sidebar-menu">
                                <% ResultSet rs = (ResultSet) request.getAttribute("rs");
                                    while (rs.next()) {
                                %>
                                <li>
                                    <a href="<%= Util.fullPath("ListBook?type=" + rs.getInt(1)) %>">
                                        <i class="fa fa-angle-double-right"></i>
                                        <%= rs.getString(2)%>
                                        <%--                                                <span>(5)</span>--%>
                                    </a>
                                </li>
                                <% } %>

                            </ul>
                        </aside>
                        <aside class="widget shop-filter">
                            <h2 class="sidebar-title text-center">PRICE SLIDER</h2>
                            <div class="info-widget">
                                <div class="price-filter">
                                    <div id="slider-range"></div>
                                    <div class="price-slider-amount">
                                        <input type="text" id="amount" name="price" placeholder="Add Your Price"/>
                                        <div class="widget-buttom">
                                            <input type="submit" value="Filter"/>
                                            <input type="reset" value="CLEAR"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </aside>
                    </div>

                    <div class="shop-widget-bottom">
                        <aside class="widget widget-tag">
                            <h2 class="sidebar-title">POPULAR TAG</h2>
                            <ul class="tag-list">
                                <li>
                                    <a href="#">e-book</a>
                                </li>
                                <li>
                                    <a href="#">writer</a>
                                </li>
                                <li>
                                    <a href="#">book’s</a>
                                </li>
                                <li>
                                    <a href="#">eassy</a>
                                </li>
                                <li>
                                    <a href="#">nice</a>
                                </li>
                                <li>
                                    <a href="#">author</a>
                                </li>
                            </ul>
                        </aside>
                        <aside class="widget widget-seller">
                            <h2 class="sidebar-title">TOP SELLERS</h2>
                            <div class="single-seller">
                                <div class="seller-img">
                                    <img src="img/shop/1.jpg" alt=""/>
                                </div>
                                <div class="seller-details">
                                    <a href="shop.jsp"><h5>Cold mountain</h5></a>
                                    <h5>$ 50.00</h5>
                                    <ul>
                                        <li><i class="fa fa-star icolor"></i></li>
                                        <li><i class="fa fa-star icolor"></i></li>
                                        <li><i class="fa fa-star icolor"></i></li>
                                        <li><i class="fa fa-star icolor"></i></li>
                                        <li><i class="fa fa-star icolor"></i></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="single-seller">
                                <div class="seller-img">
                                    <img src="img/shop/2.jpg" alt=""/>
                                </div>
                                <div class="seller-details">
                                    <a href=""><h5>The historian</h5></a>
                                    <h5>$ 50.00</h5>
                                    <ul>
                                        <li><i class="fa fa-star icolor"></i></li>
                                        <li><i class="fa fa-star icolor"></i></li>
                                        <li><i class="fa fa-star icolor"></i></li>
                                        <li><i class="fa fa-star icolor"></i></li>
                                        <li><i class="fa fa-star icolor"></i></li>
                                    </ul>
                                </div>
                            </div>
                        </aside>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="shop-tab-area">
                    <div class="shop-tab-list">
                        <div class="shop-tab-pill pull-left">
                            <ul>
                                <li class="active" id="left"><a data-toggle="pill" href="#home"><i class="fa fa-th"></i><span>Grid</span></a>
                                </li>
                                <li><a data-toggle="pill" href="#menu1"><i
                                        class="fa fa-th-list"></i><span>List</span></a></li>
                            </ul>
                        </div>
                        <div class="shop-tab-pill pull-right">
                            <ul>
                                <li class="product-size-deatils">
                                    <div class="show-label">

                                        <label><i class="fa fa-sort-amount-asc"
                                                  href=""></i>Sort
                                            by : </label>
                                        <select name="selectSearch">
                                            <option value="Possion" selected="selected">Possion</option>
                                            <option value="Name">Name</option>
                                            <option value="Price">Price</option>
                                        </select>
                                    </div>
                                </li>

                                <%
                                    Integer nOfPages = (Integer) request.getAttribute("nOfPages");
                                    Integer idType = (Integer) request.getAttribute("idType");
                                    Integer currentPage1 = (Integer) request.getAttribute("currentPage");
                                    int start1 = currentPage1;
                                    String url = "ListBook?type=" + idType + "&page=";
                                    if (idType == 0) {
                                        url = "ListBook?page=";
                                    }
                                    if (currentPage1 % 2 == 0) { %>
                                <li class="shop-pagination"><a
                                        href="<%= Util.fullPath(url + (start1-1) ) %>"><%= start1 - 1  %>
                                </a></li>
                                <li class="shop-pagination"><a
                                        href="<%= Util.fullPath(url+ (start1) ) %>"><%=start1  %>
                                </a></li>

                                <% } else {

                                %>
                                <li class="shop-pagination"><a
                                        href="<%= Util.fullPath(url + (start1) ) %>"><%= start1  %>
                                </a></li>
                                <li class="shop-pagination"><a
                                        href="<%= Util.fullPath(url + (start1+1) ) %>"><%=start1 + 1  %>
                                </a></li>
                                <% }
                                %>

                                <li class="shop-pagination"><a
                                        href="<%= Util.fullPath(url + (start1+2) ) %>"><i
                                        class="fa fa-caret-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="row tab-pane fade in active" id="home">
                            <div class="shop-single-product-area">
                                <%
                                    ResultSet book = (ResultSet) request.getAttribute("book");
                                    Integer currentPage = (Integer) request.getAttribute("currentPage");
//                                    System.out.println(currentPage);
                                    int i = -1;
                                    int start = currentPage * 9 - 9;
                                    while (book.next()) {
                                        i++;
                                        if (i < start) {
                                            continue;
                                        }
                                        if (i >= currentPage * 9) break;
//                                        System.out.println(i);

                                %>
                                <div class="col-md-4 col-sm-6">
                                    <div class="single-banner">
                                        <div class="product-wrapper">
                                            <a href="#" class="single-banner-image-wrapper">
                                                <%--                                                <img alt="" src="public/customer/img/featured/1.jpg">--%>
                                                <img alt="" src="/public/customer/img/shop/<%= book.getString(4)%>">


                                                <div class="price"><span><%= book.getInt(3)%>VND</span>
                                                </div>
                                            </a>
                                            <div class="product-description">
                                                <div class="functional-buttons">
                                                    <a href="<%= Util.fullPath("AddCart?id="+book.getInt(5))%>" title="Add to Cart">
                                                        <i class="fa fa-shopping-cart"></i>
                                                    </a>
                                                    <a href="#" title="Add to Wishlist">
                                                        <i class="fa fa-heart-o"></i>
                                                    </a>
                                                    <a title="Quick view" data-toggle="modal"
                                                       data-target="#preview<%= book.getInt(1)%>">
                                                        <%--Khai báo dòng này sẽ mở 1 cái modal có id là previewid, ví dụ book có ìd là 10 thì data-tagert là preview10, tức là mở modal có là preview10--%>
                                                        <i class="fa fa-compress"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="banner-bottom text-center">
                                            <div class="banner-bottom-title">
                                                <a href="#"><%= book.getString(2)%>
                                                </a>
                                            </div>
                                            <div class="rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Quickview Product Start -->
                                <div id="quickview-wrapper">
                                    <!-- Modal -->
                                    <div class="modal fade" id="preview<%= book.getInt(1)%>" tabindex="-1"
                                         role="dialog">
                                        <%--Tạo ra 1 modal có id là previewid để chứa thông tin book có id là id, modal này sẽ dc kích bởi data-tagert bên trên --%>
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close"><span
                                                            aria-hidden="true">&times;</span></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="modal-product">
                                                        <div class="product-images">
                                                            <div class="main-image images">
                                                                <img alt=""
                                                                     src="/public/customer/img/shop/<%= book.getString(4)%>">

                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <h1><%= book.getString(2)%>
                                                            </h1> <%--Gán title --%>
                                                            <div class="price-box">
                                                                <p class="s-price"><span class="special-price"><span
                                                                        class="amount"><%= book.getInt(3)%> VND</span></span>
                                                                </p> <%--Gán price--%>
                                                            </div>
                                                            <a href="product-details.jsp" class="see-all">See all
                                                                features</a>
                                                            <div class="quick-add-to-cart">
                                                                <form method="post" class="cart">
                                                                    <div class="numbers-row">
                                                                        <input type="number" id="french-hens" value="3">
                                                                    </div>
                                                                    <button class="single_add_to_cart_button"
                                                                            type="submit">Add to cart
                                                                    </button>
                                                                </form>
                                                            </div>
                                                            <div class="quick-desc">
                                                                <%--Gán description ử đây --%>
                                                            </div>
                                                            <div class="social-sharing">
                                                                <div class="widget widget_socialsharing_widget">
                                                                    <h3 class="widget-title-modal">Share this
                                                                        product</h3>
                                                                    <ul class="social-icons">
                                                                        <li><a target="_blank" title="Facebook" href="#"
                                                                               class="facebook social-icon"><i
                                                                                class="fa fa-facebook"></i></a></li>
                                                                        <li><a target="_blank" title="Twitter" href="#"
                                                                               class="twitter social-icon"><i
                                                                                class="fa fa-twitter"></i></a></li>
                                                                        <li><a target="_blank" title="Pinterest"
                                                                               href="#" class="pinterest social-icon"><i
                                                                                class="fa fa-pinterest"></i></a></li>
                                                                        <li><a target="_blank" title="Google +" href="#"
                                                                               class="gplus social-icon"><i
                                                                                class="fa fa-google-plus"></i></a></li>
                                                                        <li><a target="_blank" title="LinkedIn" href="#"
                                                                               class="linkedin social-icon"><i
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
                                <% } %>

                            </div>
                        </div>
                        <div id="menu1" class="tab-pane fade">
                            <div class="row">
                                <div class="single-shop-product">
                                    <div class="col-xs-12 col-sm-5 col-md-4">
                                        <div class="left-item">
                                            <a href="single-product.jsp" title="East of eden">
                                                <img src="img/featured/1.jpg" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-7 col-md-8">
                                        <div class="deal-product-content">
                                            <h4>
                                                <a href="single-product.jsp" title="East of eden">East of eden</a>
                                            </h4>
                                            <div class="product-price">
                                                <span class="new-price">$ 140.00</span>
                                                <span class="old-price">$ 120.00</span>
                                            </div>
                                            <div class="list-rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <p>Faded short sleeves t-shirt with high neckline. Soft and stretchy
                                                material for a comfortable fit. Accessorize with a straw hat and you're
                                                ready for summer!</p>
                                            <div class="availability">
                                                <span>In stock</span>
                                                <span><a href="cart.jsp">Add to cart</a></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="single-shop-product">
                                    <div class="col-xs-12 col-sm-5 col-md-4">
                                        <div class="left-item">
                                            <a href="single-product.jsp" title="People of the book">
                                                <img src="img/featured/2.jpg" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-7 col-md-8">
                                        <div class="deal-product-content">
                                            <h4>
                                                <a href="single-product.jsp" title="People of the book">People of the
                                                    book</a>
                                            </h4>
                                            <div class="product-price">
                                                <span class="new-price">$ 140.00</span>
                                                <span class="old-price">$ 120.00</span>
                                            </div>
                                            <div class="list-rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <p>Faded short sleeves t-shirt with high neckline. Soft and stretchy
                                                material for a comfortable fit. Accessorize with a straw hat and you're
                                                ready for summer!</p>
                                            <div class="availability">
                                                <span>In stock</span>
                                                <span><a href="cart.jsp">Add to cart</a></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="single-shop-product">
                                    <div class="col-xs-12 col-sm-5 col-md-4">
                                        <div class="left-item">
                                            <a href="single-product.jsp" title="The secret letter">
                                                <img src="img/featured/3.jpg" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-7 col-md-8">
                                        <div class="deal-product-content">
                                            <h4>
                                                <a href="single-product.jsp" title="The secret letter">The secret
                                                    letter</a>
                                            </h4>
                                            <div class="product-price">
                                                <span class="new-price">$ 140.00</span>
                                                <span class="old-price">$ 120.00</span>
                                            </div>
                                            <div class="list-rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <p>Faded short sleeves t-shirt with high neckline. Soft and stretchy
                                                material for a comfortable fit. Accessorize with a straw hat and you're
                                                ready for summer!</p>
                                            <div class="availability">
                                                <span>In stock</span>
                                                <span><a href="cart.jsp">Add to cart</a></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="single-shop-product">
                                    <div class="col-xs-12 col-sm-5 col-md-4">
                                        <div class="left-item">
                                            <a href="single-product.jsp" title="Lone some dove">
                                                <img src="img/featured/4.jpg" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-7 col-md-8">
                                        <div class="deal-product-content">
                                            <h4>
                                                <a href="single-product.jsp" title="Lone some dove">Lone some dove</a>
                                            </h4>
                                            <div class="product-price">
                                                <span class="new-price">$ 140.00</span>
                                                <span class="old-price">$ 120.00</span>
                                            </div>
                                            <div class="list-rating-icon">
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star icolor"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <p>Faded short sleeves t-shirt with high neckline. Soft and stretchy
                                                material for a comfortable fit. Accessorize with a straw hat and you're
                                                ready for summer!</p>
                                            <div class="availability">
                                                <span>In stock</span>
                                                <span><a href="cart.jsp">Add to cart</a></span>
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
<!-- Shop Area End -->
<!-- Footer Area Start -->
<jsp:include page="footer.jsp"/>
<!-- Footer Area End -->
<!-- all js here -->
<!-- jquery latest version -->
<jsp:include page="jquery.jsp"/>
</body>
</html>