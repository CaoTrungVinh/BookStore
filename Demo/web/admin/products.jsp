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
                            <th scope="col">&nbsp;</th>
                            <th scope="col">PRODUCT NAME</th>
                            <th scope="col">UNIT SOLD</th>
                            <th scope="col">IN STOCK</th>
                            <th scope="col">EXPIRE DATE</th>
                            <th scope="col">&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td scope="row"><input type="checkbox"/></td>
                            <td class="tm-product-name">Lorem Ipsum Product 1</td>
                            <td>1,450</td>
                            <td>550</td>
                            <td>28 March 2019</td>
                            <td>
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="checkbox"/></th>
                            <td class="tm-product-name">Lorem Ipsum Product 2</td>
                            <td>1,250</td>
                            <td>750</td>
                            <td>21 March 2019</td>
                            <td>
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="checkbox"/></th>
                            <td class="tm-product-name">Lorem Ipsum Product 3</td>
                            <td>1,100</td>
                            <td>900</td>
                            <td>18 Feb 2019</td>
                            <td>
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="checkbox"/></th>
                            <td class="tm-product-name">Lorem Ipsum Product 4</td>
                            <td>1,400</td>
                            <td>600</td>
                            <td>24 Feb 2019</td>
                            <td>
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="checkbox"/></th>
                            <td class="tm-product-name">Lorem Ipsum Product 5</td>
                            <td>1,800</td>
                            <td>200</td>
                            <td>22 Feb 2019</td>
                            <td>
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="checkbox"/></th>
                            <td class="tm-product-name">Lorem Ipsum Product 6</td>
                            <td>1,000</td>
                            <td>1,000</td>
                            <td>20 Feb 2019</td>
                            <td>
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="checkbox"/></th>
                            <td class="tm-product-name">Lorem Ipsum Product 7</td>
                            <td>500</td>
                            <td>100</td>
                            <td>10 Feb 2019</td>
                            <td>
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="checkbox"/></th>
                            <td class="tm-product-name">Lorem Ipsum Product 8</td>
                            <td>1,000</td>
                            <td>600</td>
                            <td>08 Feb 2019</td>
                            <td>
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="checkbox"/></th>
                            <td class="tm-product-name">Lorem Ipsum Product 9</td>
                            <td>1,200</td>
                            <td>800</td>
                            <td>24 Jan 2019</td>
                            <td>
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="checkbox"/></th>
                            <td class="tm-product-name">Lorem Ipsum Product 10</td>
                            <td>1,600</td>
                            <td>400</td>
                            <td>22 Jan 2019</td>
                            <td>
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="checkbox"/></th>
                            <td class="tm-product-name">Lorem Ipsum Product 11</td>
                            <td>2,000</td>
                            <td>400</td>
                            <td>21 Jan 2019</td>
                            <td>
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- table container -->
                <a
                        href="add-product.jsp"
                        class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
                <button class="btn btn-primary btn-block text-uppercase">
                    Delete selected products
                </button>
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
                        <tr>
                            <td class="tm-product-name">Product Category 1</td>
                            <td class="text-center">
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tm-product-name">Product Category 2</td>
                            <td class="text-center">
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tm-product-name">Product Category 3</td>
                            <td class="text-center">
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tm-product-name">Product Category 4</td>
                            <td class="text-center">
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tm-product-name">Product Category 5</td>
                            <td class="text-center">
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tm-product-name">Product Category 6</td>
                            <td class="text-center">
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tm-product-name">Product Category 7</td>
                            <td class="text-center">
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tm-product-name">Product Category 8</td>
                            <td class="text-center">
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tm-product-name">Product Category 9</td>
                            <td class="text-center">
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tm-product-name">Product Category 10</td>
                            <td class="text-center">
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tm-product-name">Product Category 11</td>
                            <td class="text-center">
                                <a href="#" class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- table container -->
                <button class="btn btn-primary btn-block text-uppercase mb-3">
                    Add new category
                </button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>



<script src="/public/admin/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->

<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script src="/public/admin/js/bootstrap.min.js"></script>


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
                {"orderable": false, "targets": [0]},
                {"orderable": false, "targets": [5]},
                {"width": "0%", "targets": 5}
                ]
        });
        $('#category').DataTable({
            "bLengthChange": false,
            "bFilter": true,
            "bInfo": false,
            "bAutoWidth": false });
    });



</script>
</body>
</html>