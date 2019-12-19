<%@ page import="Util.Util" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Product</title>
    <jsp:include page="head.jsp"/>

    <link href="/public/admin/css/jquery-editable-select.min.css" rel="stylesheet">
    <script src="https://cdn.ckeditor.com/ckeditor5/16.0.0/classic/ckeditor.js"></script>
</head>

<body>
<jsp:include page="header.jsp"/>

<div class="container tm-mt-big tm-mb-big">
    <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                <div class="row">
                    <div class="col-12">
                        <h2 class="tm-block-title d-inline-block">Add Product</h2>
                    </div>
                </div>
                <div class="row tm-edit-product-row">
                    <div class="col-xl-6 col-lg-6 col-md-12">
                        <form action="<%= Util.fullPath("admin/product/add") %>" method="POST" onsubmit="onFormSubmit"
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
                                ></textarea>
                            </div>
                            <div class="form-group mb-3">
                                <label
                                >Category</label
                                >
                                <input type="hidden" name="category" id="category">
                                <select
                                        class="custom-select tm-select-accounts"
                                        id="selectCetagories"
                                        required
                                >
                                    <%
                                        ResultSet categories = (ResultSet) request.getAttribute("categories");
                                        while (categories.next()) {
                                    %>
                                    <option data-cc="<%= categories.getString("id")%>"><%= categories.getString("name")%>
                                    </option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="form-group mb-3">
                                <label
                                >Publisher</label
                                >
                                <input type="hidden" name="publisher" id="publisher">
                                <select
                                        class="custom-select tm-select-accounts"
                                        id="selectPublisher"
                                        required
                                >
                                    <%
                                        ResultSet publisher = (ResultSet) request.getAttribute("publisher");
//
                                        while (publisher.next()) {
                                    %>
                                    <option data-cc="<%= publisher.getString("id")%>"><%= publisher.getString("name")%>
                                    </option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="form-group mb-3">
                                <label
                                >Author</label
                                >
                                <input type="hidden" name="author" id="author">
                                <select
                                        class="custom-select tm-select-accounts"
                                        id="selectAuthor"
                                        required
                                >
                                    <%
                                        ResultSet authors = (ResultSet) request.getAttribute("authors");
//
                                        while (authors.next()) {
                                    %>
                                    <option data-cc="<%= authors.getString("id")%>"><%= authors.getString("name")%>
                                    </option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="row">
                                <div class="form-group mb-3 col-xs-12 col-sm-6">
                                    <label for="expire_date">Price
                                    </label>
                                    <input
                                            id="expire_date"
                                            name="price"
                                            type="text"
                                            class="form-control novalidate"
                                            data-large-mode="true"
                                            required
                                    />
                                </div>
                                <div class="form-group mb-3 col-xs-12 col-sm-6">
                                    <label
                                            for="stock"
                                    >Units In Stock
                                    </label>
                                    <input
                                            id="stock"
                                            name="stock"
                                            type="text"
                                            class="form-control novalidate"
                                            required
                                    />
                                </div>
                            </div>
                            <div class="form-group mb-3">

                                <label>Decentralization</label>

                                <br>
                                <input type="radio" value="0" name="group" id="hide2" checked="checked">
                                <label for="hide2">Admin</label>
                                <br>
                                <input type="radio" value="1" name="group" id="hide1">
                                <label for="hide1">Customer</label>

                            </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                        <div class="tm-product-img-dummy mx-auto">
                            <i
                                    class="fas fa-cloud-upload-alt tm-upload-icon"
                                    onclick="document.getElementById('fileInput').click();"
                            ></i>
                        </div>
                        <div class="custom-file mt-3 mb-3">
                            <input id="fileInput" type="file" name="miages[]" multiple style="display:none;"/>
                            <input
                                    type="button"
                                    class="btn btn-primary btn-block mx-auto"
                                    value="UPLOAD PRODUCT IMAGE"
                                    onclick="selectFileWithCKFinder( 'fileInput' );"
                            />
                        </div>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
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
<script>
    function selectFileWithCKFinder(elementId) {
        CKFinder.modal({
            chooseFiles: true,
            displayFoldersPanel: false,
            width: 800,
            height: 600,
            onInit: function (finder) {
                finder.on('files:choose', function (evt) {
                    var file = evt.data.files.first();
                    var output = document.getElementById(elementId);
                    output.value = file.getUrl();
                });

                finder.on('file:choose:resizedImage', function (evt) {
                    var output = document.getElementById(elementId);
                    output.value = evt.data.resizedUrl;
                });
            }
        });
    }

    var editor

    function onFormSubmit() {
        if (editor) {
            editor.updateSourceElement();
            console.log(editor.getData());
        } else {
            console.log("NULL");
        }
    }

    //IDE bị ngu, không nhận cú pháp => của ES6, nên phải dùng cú pháp này
    //Nếu không bấm format nó sẽ nhảy ngu
    $(function () {
        window.jQuery = $;
        // $("#expire_date").datepicker();
        ClassicEditor
            .create(document.querySelector('#editor')) //Đến đoạn này là editor đã chạy xong
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
