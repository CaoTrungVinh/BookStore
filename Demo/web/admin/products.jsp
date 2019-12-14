<%@ page import="java.sql.ResultSet" %>
<%@ page import="Util.Util" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Product Page - Admin</title>


    <jsp:include page="head.jsp"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">

    <style>
        .table th {
            padding: 10px !important;
        }

        .table tbody td {
            cursor: pointer;
        }

        #category_filter {
            margin-left: -50%;
        }
    </style>

</head>

<body id="reportsPage">
<jsp:include page="header.jsp"/>

<div class="container mt-5">
    <div class="row tm-content-row">
        <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-products">
                <div class="tm-product-table-container">
                    <%--                    <table class="table table-hover tm-table-small tm-product-table">--%>
                    <table id="product"
                           class="table table-striped table-bordered "
                           style="width:100%">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">PRODUCT NAME</th>
                            <th scope="col">PRICE</th>
                            <th scope="col">IN STOCK</th>
                            <th scope="col">RATING</th>
                            <th scope="col">&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>

                        <%
                            ResultSet book = (ResultSet) request.getAttribute("book");
//
                            int stt = 0;
                            while (book.next()) {
                                stt++;

                        %>
                        <tr>
                            <td scope="row"><%= stt%>
                            </td>
                            <td class="tm-product-name"><%= book.getString("title")%>
                            </td>


                            <td><%= book.getString("price")%>
                            </td>
                            <td><%= book.getString("in_stock")%>
                            </td>
                            <td><%= book.getString("rating")%>
                            </td>
                            <td>
                                <a href="<%= Util.fullPath("/admin/product/delete?id=" + book.getString("id")) %>" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>


                            </td>
                        </tr>
                        <% } %>

                        </tbody>
                    </table>
                </div>
                <!-- table container -->
<%--                <a--%>
<%--                        href="<%= Util.fullPath("/admin/add-product") %>"--%>
<%--                        class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>--%>
                <%--                <button class="btn btn-primary btn-block text-uppercase">--%>
                <%--                    Delete selected products--%>
                <%--                </button>--%>
            </div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-product-categories">
                <h2 class="tm-block-title">Product Categories</h2>
                <div class="tm-product-table-container">
                    <table id="category"
                           class="table table-striped table-bordered "
                           style="width:100%">
                        <thead>
                        <th>Name</th>
                        <th></th>
                        </thead>
                        <tbody>
                        <%
                            ResultSet categories = (ResultSet) request.getAttribute("categories");
//
//                            int stt = 0;
                            while (categories.next()) {
//                                stt++;

                        %>
                        <tr>
                            <td class="tm-product-name"><%= categories.getString("name")%>
                            </td>
                            <td class="text-center">
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
                <!-- table container -->
<%--                <button class="btn btn-primary btn-block text-uppercase mb-3">--%>
<%--                    Add new category--%>
<%--                </button>--%>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>


<script src="/public/admin/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->

<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="/public/admin/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>


<%--<script src="https://code.jquery.com/jquery-3.3.1.js"></script>--%>
<%--<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>--%>

<!-- https://getbootstrap.com/ -->
<script>
    $(function () {
        $(".tm-product-name").on("click", function () {
            window.location.href = "edit-product.jsp";
        });
    });

    $(document).ready(function () {
        $('#product').DataTable({
            "columnDefs": [

                {"orderable": false, "targets": [5]},
                {"width": "0%", "targets": 5},
                {"width": "50%", "targets": 1}
            ],
            dom: 'Bfrtip',
            buttons: [
                {
                    text: 'New product',
                    className: "btn btn-primary",
                    action: function () {
                        window.location.href = "/admin/add-product";
                    }
                }
            ]


        });
        $('#category').DataTable({
            "bLengthChange": false,
            "bFilter": true,
            "bInfo": false,
            "bAutoWidth": false,
            buttons: [
                {
                    text: 'My button',
                    action: function (e, dt, node, config) {
                        alert('Button activated');
                    }
                }
            ]
        });
    });


</script>
</body>
</html>