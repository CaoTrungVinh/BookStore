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
            <tr>
                <td><%= detail.getString("orderDate")%>
                </td>
                <td><%= detail.getString("title")%>
                </td>
                <td><%= detail.getString("price")%> đ</td>
                <td>
                    <% if (detail.getString("statusID").equals(2)) {%>
                    <a href="#">Hủy đơn hàng</a>
                    <% } else {%>
                    <%--                    <a href="#">Đơn vị đang vận chuyển</a>--%>
                    <a href="#"><%= detail.getString("statusID")%>
                    </a>
                    <% } %>
                </td>
            </tr>
            <% } %>
            <tr>
                <td><a href="#">Hủy đơn hàng</a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="list-pager">

    </div>
</div>