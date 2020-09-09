<%@ page import="Util.Util" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Ordered" %>
<%@ page import="java.sql.ResultSet" %>

<%
    ArrayList<Ordered> ordereds = (ArrayList<Ordered>) request.getAttribute("ordereds");
    if (ordereds.size() == 0) {
%>

<div class="content-right">
    <div class="row">
        <div class="col-xs-12">
            <h5 class="lbl-shopping-cart lbl-shopping-cart-gio-hang">Order history <span>(0 product)</span></h5>
            <div class="empty-cart">
                <span class="mascot-image"></span>
                <p class="message">You have no items in your order history.</p>
                <a href="/" class="btn btn-yellow">Continue shopping</a>
            </div>
        </div>
    </div>
</div>
<%} else {%>
<div class="content-right">
    <h1 class="have-margin">Chi tiết đơn hàng</h1>
    <div class="dashboard-order have-margin">
        <table class="table-responsive-2 list">
            <thead>
            <tr>
            </tr>
            </thead>
            <tbody>
            <%
                for (Ordered item : ordereds) { %>
            <tr>
            </tr>
            <% }
            } %>

            </tbody>
        </table>
    </div>

    <div class="dashboard-order have-margin">
        <table class="table-responsive-2 list">
            <thead>
            <tr>
                <th>Order date</th>
                <th>Book</th>
                <th>Total</th>
            </tr>
            </thead>
            <tbody>

            <%
                ResultSet detail = (ResultSet) request.getAttribute("detail");
                while (detail.next()) {
            %>
            <form action="<%= Util.fullPath("account/order-detail?id="+detail.getString("id_order")) %>"
                  method="POST" onsubmit="onFormSubmit"
                  class="tm-edit-product-form">
                <tr>
                    <td><%= detail.getString("orderDate")%>
                    </td>
                    <td><%= detail.getString("title")%>
                    </td>
                    <td><%= detail.getString("price")%> đ</td>
                </tr>
                <% } %>
                <%
                    ResultSet hdh = (ResultSet) request.getAttribute("hdh");
                    while (hdh.next()) {
                %>
                <tr>
                    <td>
                        <% if (hdh.getString("status").equals("shipping")) {%>
                        Đang vận chuyển
                        <% } else {%>
                        <button type="submit">Hủy đơn hàng</button>
                        </a>
                        <% } %>
                    </td>
                </tr>

                <% } %>
            </form>
            </tbody>
        </table>
    </div>
    <div class="list-pager">

    </div>
</div>