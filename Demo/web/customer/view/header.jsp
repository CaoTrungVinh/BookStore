<%@ page import="controller.page.ListBook" %>
<%@ page import="Util.Util" %>
<%@ page import="Model.Cart" %>
<%@ page import="Model.Wish" %>
<!--Header Area Start-->
<div class="header-area bg-white">
    <div class="container">
        <div class="row">
            <div class="col-md-2 col-sm-6 col-xs-6">
                <div class="header-logo">
                    <a href="../../index.jsp">
                        <img src="/public/customer/img/logo.png" alt="">
                    </a>
                </div>
            </div>
            <div class="col-md-1 col-sm-6 visible-sm  col-xs-6">
                <div class="header-right">
                    <ul>
                        <li>
                            <a href="account.jsp"><i class="flaticon-people"></i></a>
                        </li>
                        <li class="shoping-cart">
                            <a href="#">
                                <i class="flaticon-shop"></i>
                                <span>2</span>
                            </a>
                            <div class="add-to-cart-product">
                                <div class="cart-product">
                                    <div class="cart-product-image">
                                        <a href="single-product.jsp">
                                            <img src="public/customer/img/shop/1.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="cart-product-info">
                                        <p>
                                            <span>1</span>
                                            x
                                            <a href="single-product.jsp">East of eden</a>
                                        </p>
                                        <a href="single-product.jsp">S, Orange</a>
                                        <span class="cart-price">$ 140.00</span>
                                    </div>
                                    <div class="cart-product-remove">
                                        <i class="fa fa-times"></i>
                                    </div>
                                </div>
                                <div class="cart-product">
                                    <div class="cart-product-image">
                                        <a href="single-product.jsp">
                                            <img src="public/customer/img/shop/1.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="cart-product-info">
                                        <p>
                                            <span>1</span>
                                            x
                                            <a href="single-product.jsp">East of eden</a>
                                        </p>
                                        <a href="single-product.jsp">S, Orange</a>
                                        <span class="cart-price">$ 140.00</span>
                                    </div>
                                    <div class="cart-product-remove">
                                        <i class="fa fa-times"></i>
                                    </div>
                                </div>
                                <div class="total-cart-price">
                                    <div class="cart-product-line fast-line">
                                        <span>Shipping</span>
                                        <span class="free-shiping">$10.50</span>
                                    </div>
                                    <div class="cart-product-line">
                                        <span>Total</span>
                                        <span class="total">$ 140.00</span>
                                    </div>
                                </div>
                                <div class="cart-checkout">
                                    <a href="checkout.jsp">
                                        Check out
                                        <i class="fa fa-chevron-right"></i>
                                    </a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9 col-sm-12 hidden-xs">
                <div class="mainmenu text-center">
                    <nav>
                        <ul id="nav">
                            <li><a href="../../index.jsp">HOME</a></li>
                            <li><a href="<%= Util.fullPath("list-book")%>">LIST BOOK</a></li>
                            <li><a href="<%= Util.fullPath("contact")%>">CONTACT</a></li>
                            <li><a href="<%= Util.fullPath("about")%>">ABOUT</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-md-1 hidden-sm">
                <div class="header-right" style="margin-left: -100px;">
                    <ul>
                        <li style="margin-right: 5px">
                            <a href="my-account.jsp"><i class="flaticon-people"></i>
                            </a>
                        </li>
                        <li class="shoping-cart" style="margin-right: 5px">
                            <a href="<%= Util.fullPath("show-cart")%>">
                                <i class="flaticon-shop"></i>
                                <% Cart c = (Cart) session.getAttribute("Cart");
                                    int count = c == null ? 0 : c.list().size();
                                %>
                                <span><%= count%></span>
                            </a>
                            <div class="add-to-cart-product">
                                <div class="cart-product">
                                    <div class="cart-product-image">
                                        <a href="single-product.jsp">
                                            <img src="public/customer/img/shop/1.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="cart-product-info">
                                        <p>
                                            <span>1</span>
                                            x
                                            <a href="single-product.jsp">East of eden</a>
                                        </p>
                                        <a href="single-product.jsp">S, Orange</a>
                                        <span class="cart-price">$ 140.00</span>
                                    </div>
                                    <div class="cart-product-remove">
                                        <i class="fa fa-times"></i>
                                    </div>
                                </div>
                                <div class="total-cart-price">
                                    <div class="cart-product-line fast-line">
                                        <span>Shipping</span>
                                        <span class="free-shiping">$10.50</span>
                                    </div>
                                    <div class="cart-product-line">
                                        <span>Total</span>
                                        <span class="total">$
                                        <%= c!= null ? c.total() :0 %></span>
                                    </div>
                                </div>
                                <div class="cart-checkout">
                                    <a href="#">
                                        Check out
                                        <i class="fa fa-chevron-right"></i>
                                    </a>
                                </div>
                            </div>
                        </li>

                        <li class="shoping-cart" style="margin-right: 5px">

                            <a href="<%= Util.fullPath("show-wish")%>">
                                <i class="fa fa-heartbeat"></i>
                                <% Wish wish = (Wish) session.getAttribute("Wish");
                                    int countWish = wish == null ? 0 : wish.list().size();
                                %>
                                <span><%= countWish%></span>
                            </a>

                            <div class="add-to-cart-product">
                                <div class="cart-product">
                                    <div class="cart-product-image">
                                        <a href="single-product.jsp">
                                            <img src="public/customer/img/shop/1.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="cart-product-info">
                                        <p>
                                            <span>1</span>
                                            x
                                            <a href="single-product.jsp">East of eden</a>
                                        </p>
                                        <a href="single-product.jsp">S, Orange</a>
                                        <span class="cart-price">$ 140.00</span>
                                    </div>
                                    <div class="cart-product-remove">
                                        <i class="fa fa-times"></i>
                                    </div>
                                </div>
                                <div class="cart-product">
                                    <div class="cart-product-image">
                                        <a href="single-product.jsp">
                                            <img src="public/customer/img/shop/1.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="cart-product-info">
                                        <p>
                                            <span>1</span>
                                            x
                                            <a href="single-product.jsp">East of eden</a>
                                        </p>
                                        <a href="single-product.jsp">S, Orange</a>
                                        <span class="cart-price">$ 140.00</span>
                                    </div>
                                    <div class="cart-product-remove">
                                        <i class="fa fa-times"></i>
                                    </div>
                                </div>
                                <div class="total-cart-price">
                                    <div class="cart-product-line fast-line">
                                        <span>Shipping</span>
                                        <span class="free-shiping">$10.50</span>
                                    </div>
                                    <div class="cart-product-line">
                                        <span>Total</span>
                                        <span class="total">$ 140.00</span>
                                    </div>
                                </div>
                                <div class="cart-checkout">
                                    <a href="wishlist.jsp">
                                        WISH LIST
                                        <i class="fa fa-chevron-right"></i>
                                    </a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="search.jsp"><i class="fa fa-search"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Header Area End-->
<!-- Mobile Menu Start -->
<div class="mobile-menu-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="mobile-menu">
                    <nav id="dropdown">
                        <ul>
                            <li><a href="../../index.jsp">HOME</a></li>
                            <li><a href="<%= Util.fullPath("ListBook")%>">FEATURED</a></li>
                            <li><a href="shop.jsp">REVIEW BOOK</a></li>
                            <li><a href="about.jsp">ABOUT AUTHOR</a></li>
                            <li><a href="#">pages</a>
                                <ul>
                                    <li><a href="about.jsp">About Us</a></li>
                                    <li><a href="cart.jsp">Cart Page</a></li>
                                    <li><a href="checkout.jsp">Check Out</a></li>
                                    <li><a href="contact.jsp">Contact</a></li>
                                    <li><a href="login.jsp">Login</a></li>
                                    <li><a href="my-account.jsp">My Account</a></li>
                                    <li><a href="shop.jsp">Shopping Page</a></li>
                                    <li><a href="single-product.jsp">Single Shop Page</a></li>
                                    <li><a href="wishlist.jsp">Wishlist Page</a></li>
                                    <li><a href="404.jsp">404 Page</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.jsp">CONTACT</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Mobile Menu End -->