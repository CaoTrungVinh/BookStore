<%@ page import="Util.Util" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Product</title>
    <jsp:include page="head.jsp"/>

    <link href="/public/admin/css/jquery-editable-select.min.css" rel="stylesheet">
    <script src="https://cdn.ckeditor.com/ckeditor5/16.0.0/classic/ckeditor.js"></script>

    <style>

        .border-img {
            border: 1px solid #cccccc;
            margin-left: 0;
            margin-right: 0;
            background-color: #ffffff;
        }

        .cart-product {

            font-weight: normal;
            overflow: hidden;
            padding: 15px;
            position: relative;
            width: 150px;
        }

        .cart-product-image {
            float: left;
            margin-right: 15px;
            width: 82px;
        }

        .cart-product-image a {
            border: 1px solid #ebebeb;
            float: left;
        }

        .cart-product-remove {
            position: absolute;
            right: 32px;
            top: 10px;
            width: 15px;
        }

        .cart-product-remove i {
            background: #44434399;
            border-radius: 100%;
            color: #ffffff;
            cursor: pointer;
            display: table-cell;
            font-size: 10px;
            height: 15px;
            text-align: center;
            transition: all 0.3s ease 0s;
            vertical-align: middle;
            width: 20px;
        }

        img {
            max-width: 100%;
            height: auto;
        }

        .add-img {
            max-width: 100%;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            background: #aaa;
        }
    </style>

</head>

<body>
<jsp:include page="header.jsp"/>

<div class="container tm-mt-big tm-mb-big">
    <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                <div class="row">
                    <div class="col-12">
                        <h2 class="tm-block-title d-inline-block">Edit Product</h2>
                    </div>
                </div>
                <div class="row tm-edit-product-row justify-content-center">
                    <div class="col-xl-8 col-lg-8 col-md-12">
                        <%
                            ResultSet books = (ResultSet) request.getAttribute("books");
                        %>
                        <form action="<%= Util.fullPath("admin/product/edit?id="+books.getString("id")) %>"
                              method="POST" onsubmit="onFormSubmit"
                              class="tm-edit-product-form">

                            <div class="form-group mb-3">
                                <label
                                        for="name"
                                >Product Name
                                </label>
                                <input
                                        id="name"
                                        name="name"
                                        type="text"
                                        class="form-control novalidate"
                                        value="<%= books.getString("title")%>"
                                        required
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="editor"
                                >Description</label
                                >
                                <textarea id="editor"
                                          name="description"
                                          class="form-control novalidate"
                                          rows="3"
                                ><%= books.getString("description")%></textarea>
                            </div>

                            <div class="form-group mb-3 ">
                                <label>Images </label>
                                <div id="imgContainer" class="row border-img">

                                    <%
                                        ResultSet imgs = (ResultSet) request.getAttribute("imgs");
                                        for (int i = 1; i <= 3; i++) {

                                            if (imgs.next()) {

                                    %>
                                    <div class="cart-product col-xl-3 col-lg-3 col-md-3"
                                         id="img<%=imgs.getString("id")%>">
                                        <div class="cart-product-image">
                                            <a href="single-product.jsp">
                                                <img src="/public/customer/img/shop/images/<%=imgs.getString("img")%>"
                                                     alt="">
                                            </a>
                                            <div class="cart-product-remove"
                                                 onclick="removeCartProduct('img<%=imgs.getString("id")%>')">
                                                <i class="fa fa-times"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <input hidden name="imgPlaceHolder<%=i%>" value="<%=imgs.getString("img")%>">
                                    <% } else {
                                    %>
                                    <div id="imgPlaceHolder<%=i%>" class="cart-product col-xl-4 col-lg-4 col-md-4">
                                        <div class="add-img" onclick="ckFinder('imgPlaceHolder<%=i%>')"
                                             style="cursor: pointer">
                                            <i class="fa fa-plus"></i>
                                        </div>
                                    </div>
                                    <input hidden name="imgPlaceHolder<%=i%>" value="">
                                    <% }
                                    }
                                    %>


                                </div>
                            </div>

                            <div class="form-group mb-3">
                                <label
                                >Category</label
                                >
                                <input type="hidden" name="category" id="category"
                                       value="<%= books.getString("type")%>">
                                <select
                                        class="custom-select tm-select-accounts"
                                        id="selectCetagories"
                                >

                                    <%
                                        ResultSet categories = (ResultSet) request.getAttribute("categories");
//
                                        while (categories.next()) {


                                    %>
                                    <option
                                            <%= categories.getString("id").equals(books.getString("type")) ? "selected" : "" %>

                                            data-cc="<%= categories.getString("id")%>"><%= categories.getString("name")%>
                                    </option
                                    >
                                    <% } %>
                                </select>
                            </div>
                            <div class="form-group mb-3">
                                <label
                                >Publisher</label
                                >
                                <input type="hidden" name="publisher" id="publisher"
                                       value="<%= books.getString("publisher")%>">>
                                <select
                                        class="custom-select tm-select-accounts"
                                        id="selectPublisher"

                                >

                                    <%
                                        ResultSet publisher = (ResultSet) request.getAttribute("publisher");
                                        while (publisher.next()) {

                                    %>
                                    <option
                                            <%= publisher.getString("id").equals(books.getString("publisher")) ? "selected" : "" %>
                                            data-cc="<%= publisher.getString("id")%>"><%= publisher.getString("name")%>
                                    </option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="form-group mb-3">
                                <label
                                >Author</label
                                >
                                <input type="hidden" name="author" id="author" value="<%= books.getString("author")%>">>
                                <select
                                        class="custom-select tm-select-accounts"
                                        id="selectAuthor"

                                >

                                    <%
                                        ResultSet authors = (ResultSet) request.getAttribute("authors");
//
                                        while (authors.next()) {

                                    %>
                                    <option
                                            <%= authors.getString("id").equals(books.getString("author")) ? "selected" : "" %>

                                            data-cc="<%= authors.getString("id")%>"><%= authors.getString("name")%>
                                    </option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="row">
                                <div class="form-group mb-3 col-xs-12 col-sm-6">
                                    <label>Price
                                    </label>
                                    <input
                                            value="<%= books.getString("price")%>"
                                            name="price"
                                            type="text"
                                            class="form-control novalidate"
                                            data-large-mode="true"
                                    />
                                </div>
                                <div class="form-group mb-3 col-xs-12 col-sm-6">
                                    <label
                                            for="stock"
                                    >Units In Stock
                                    </label>
                                    <input
                                            value="<%= books.getString("in_stock")%>"
                                            id="stock"
                                            name="stock"
                                            type="text"
                                            class="form-control novalidate"
                                            required
                                    />
                                </div>
                            </div>
                    </div>

                    <div class="col-12">
                        <button type="submit" class="btn btn-primary btn-block text-uppercase">UPDATE</button>
                    </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

<script src="/public/admin/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="/public/admin/jquery-ui-datepicker/jquery-ui.min.js"></script>
<!-- https://jqueryui.com/download/ -->
<script src="/public/admin/js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script src="/public/admin/js/jquery-editable-select.min.js"></script>

<!-- https://getbootstrap.com/ -->
<script src="/public/admin/js/jquery-editable-select.min.js"></script>
<script src="/ckfinder/ckfinder.js"></script>
<script>

    var editor;

    function onFormSubmit() {
        if (editor) {
            editor.updateSourceElement();
            console.log(editor.getData());
        } else {
            console.log("NULL");
        }
    }

    function addImage(id, fileUrl) {
        document.getElementById(id).innerHTML =
            '<div class="cart-product-image"><a href="single-product.jsp"><img src="'
            + fileUrl + '" alt=""></a><div class="cart-product-remove" onclick="removeCartProduct(\''
            + id + '\')"><i class="fa fa-times"></i></div></div>' + ' <input hidden name="' + id + '" value="' + fileUrl + '">';


    }

    function removeCartProduct(id) {
        document.getElementById(id).innerHTML = '<div class="add-img" onclick="ckFinder(\'' + id + '\')" style="cursor: pointer"> <i class="fa fa-plus"></i></div>'
    }

    function ckFinder(id) {
        var finder = new CKFinder();
        finder.basePath = '/ckfinder/';
        finder.selectActionFunction = function (fileUrl, data, allFiles) {
            addImage(id, fileUrl);
        };
        finder.popup();
    }

    $(function () {
        window.jQuery = $;
        // $("#expire_date").datepicker();
        ClassicEditor
            .create(document.querySelector('#editor'), {//Đến đoạn này là editor đã chạy xong
                cloudServices: {
                    tokenUrl: 'http://localhost:8080/',
                    uploadUrl: 'https://public/admin/img'
                }
            })
            .then(function (e) { //Đoạn này bug nên nó chết
                editor = e;
            })
            .catch(function (error) {
                console.log(error);
            });

        //Dẫn đến dưới này k chạy

        $('#selectCetagories').editableSelect()
            .on('select.editable-select', function (e, el) {
                // el is the selected item "option"
                $('#category').val(el.data('cc'));
            });
        $('#selectPublisher').editableSelect()
            .on('select.editable-select', function (e, el) {
                // el is the selected item "option"
                $('#publisher').val(el.data('cc'));
            });
        $('#selectAuthor').editableSelect()
            .on('select.editable-select', function (e, el) {
                // el is the selected item "option"
                $('#author').val(el.data('cc'));
            });
    });


</script>
</body>
</html>
