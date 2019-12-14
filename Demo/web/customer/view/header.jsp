<%@ page import="controller.page.ListBook" %>
<%@ page import="Util.Util" %>
<%@ page import="Model.Cart" %>
<%@ page import="Model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.BookItem" %>
<!--Header Area Start-->
<div class="header-area bg-white">
    <div class="container">
        <div class="row">
            <div class="col-md-2 col-sm-6 col-xs-6">
                <div class="header-logo">
                    <a href="<%= Util.fullPath("Index")%>">
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
                            <li><a href="<%= Util.fullPath("Index")%>">HOME</a></li>
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
                        <li class="shoping-cart" style="margin-right: 5px;">

                            <% if (request.getSession().getAttribute("user") == null) { %>
                            <a href="<%= Util.fullPath("login")%>"><i class="fa fa-sign-in"></i>
                                    <% } else { %>
                                <a href="<%= Util.fullPath("account")%>"><i class="flaticon-people"></i>
                                    <% } %>

                                </a>
                        </li>
                        <li class="shoping-cart" style="margin-right: 5px">
                            <%
                                User user = (User) request.getSession().getAttribute("user");
                                ArrayList<BookItem> card = null;
                                if (user != null) {
                                    card = user.getShoppingCart();
                                } else {
                                    card = (ArrayList<BookItem>) request.getSession().getAttribute("card");
                                    user = new User();
                                    user.setShoppingCart(card);
                                }

                            %>
                            <a href="#">
                                <i class="flaticon-shop"></i>
                                <span id="shopping-cart-counter">
                                    <%=card.size()%>
                                </span>
                            </a>
                            <div id="shopping-cart-wrapper" class="add-to-cart-product">
                                <%for (BookItem item : card) {%>
                                <div class="cart-product">
                                    <div class="cart-product-image">
                                        <a href="single-product.jsp">
                                            <img src="public/customer/img/shop/<%=item.getImg()%>" alt="">
                                        </a>
                                    </div>
                                    <div class="cart-product-info">
                                        <p>
                                            <span><%=item.getQuantity()%></span>
                                            x
                                            <a href="single-product.jsp"><%=item.getName()%>
                                            </a>
                                        </p>
                                        <span class="cart-price"><%
                                            Math.floor(item.getQuantity() * item.getPrice());%></span>
                                    </div>
                                    <div class="cart-product-remove">
                                        <i class="fa fa-times"></i>
                                    </div>
                                </div>
                                <%}%>
                                <div class="total-cart-price">
                                    <div class="cart-product-line">
                                        <span>Total</span>
                                        <% if (card.size() != 0) {%>
                                        <span class="total">
                                       <%=Math.floor(user.getTotalPrice())%> VND></span>
                                        <%} else {%>
                                        <span class="total">
                                      0 VND></span>
                                        <%}%>
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
                            <a href="#">
                                <i class="fa fa-heartbeat"></i>
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
                                    <%--                                    <div class="card-product-line fast-line">--%>
                                    <%--                                        <span>Shipping</span>--%>
                                    <%--                                        <span class="free-shiping">$10.50</span>--%>
                                    <%--                                    </div>--%>
                                    <%--                                    <div class="card-product-line">--%>
                                    <%--                                        <span>Total</span>--%>
                                    <%--                                        <span class="total">$ 140.00</span>--%>
                                    <%--                                    </div>--%>
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
