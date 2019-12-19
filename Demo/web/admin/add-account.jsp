<%@ page import="java.sql.ResultSet" %>
<%@ page import="Util.Util" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Account</title>
    <jsp:include page="head.jsp"/>

    <link href="/public/admin/css/jquery-editable-select.min.css" rel="stylesheet">
    <script src="https://cdn.ckeditor.com/ckeditor5/16.0.0/classic/ckeditor.js"></script>
</head>

<body>
<jsp:include page="header.jsp"/>

<div class="container tm-mt-big tm-mb-big">
    <div class="row">
        <div class="col-xl-7 col-lg-10 col-md-12 col-sm-12 mx-auto">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                <div class="row">
                    <div class="col-12" style="margin-left: 13%">
                        <h2 class="tm-block-title d-inline-block">Add Account</h2>
                    </div>
                </div>
                <div class="row tm-edit-product-row">
                    <div class="col-xl-9 col-lg-6 col-md-12" style="margin: auto">
                        <form action="<%= Util.fullPath("/admin/account/add") %>" method="POST" onsubmit="onFormSubmit"
                              class="tm-edit-product-form">
                            <div class="form-group mb-3">
                                <label
                                        for="name"
                                >Name
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
                                        for="email"
                                >Email
                                </label>
                                <input
                                        id="email"
                                        name="email"
                                        type="email"
                                        class="form-control novalidate"
                                        required
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="fullname"
                                >Full name
                                </label>
                                <input
                                        id="fullname"
                                        name="fullname"
                                        type="text"
                                        class="form-control novalidate"
                                        required
                                />
                            </div>

                            <div class="form-group mb-3">
                                <label
                                >Gender</label>
<%--                                <input type="hidden" name="gender" id="gender">--%>
<%--                                <select--%>
<%--                                        class="custom-select tm-select-accounts"--%>
<%--                                        id="selectgender"--%>
<%--                                        required>--%>
<%--                                    <option data-cc="1">Nam--%>
<%--                                    </option>--%>
<%--                                    <option data-cc="0">Nữ--%>
<%--                                    </option>--%>
<%--                                </select>--%>
                                <select name="gender"  style="display: block;width: 100%;height: calc(2.25rem + 2px);padding: .375rem .75rem;font-size: 1rem;line-height: 1.5;color: #495057;background-color: #fff;background-clip: padding-box;border: 1px solid #ced4da;border-radius: .25rem;transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;">
                                    <option value="Male">Male
                                    </option>
                                    <option value="Female">Female
                                    </option>
                                </select>
                            </div>

                            <div class="form-group mb-3">
                                <label
                                        for="dateofbirth"
                                >Birth Day
                                </label>
                                <input
                                        id="dateofbirth"
                                        name="dateofbirth"
                                        type="date"
                                        class="form-control novalidate"
                                        required
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="address"
                                >Address
                                </label>
                                <input
                                        id="address"
                                        name="address"
                                        type="text"
                                        class="form-control novalidate"
                                        required
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="phone"
                                >Phone
                                </label>
                                <input
                                        id="phone"
                                        name="phone"
                                        type="number"
                                        class="form-control novalidate"
                                        required
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="avt"
                                >Avt
                                </label>
                                <input
                                        id="avt"
                                        name="avt"
                                        type="number"
                                        class="form-control novalidate"
<%--                                        required--%>
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="idgroup"
                                >Group
                                </label>
                                <input
                                        id="idgroup"
                                        name="idgroup"
                                        type="number"
                                        class="form-control novalidate"
<%--                                        required--%>
                                />
                            </div>

                            <div class="form-group mb-3">
                                <label>Active</label>

                                <select name="is_active" style="display: block;width: 100%;height: calc(2.25rem + 2px);padding: .375rem .75rem;font-size: 1rem;line-height: 1.5;color: #495057;background-color: #fff;background-clip: padding-box;border: 1px solid #ced4da;border-radius: .25rem;transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;">
                                    <option value="1">Admin
                                    </option>
                                    <option value="0">Customer
                                    </option>
                                </select>
                            </div>
                    </div>
                    <div class="col-9" style="margin: auto">
                        <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Account Now</button>
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
            .create(document.querySelector('#editor'))
            .then(function (value) {
                editor = value;
            })
            .catch(function (reason) {
                console.log(reason);
            })
        ;

        $('#selectcustomer').editableSelect()
            .on('select.editable-select', function (e, el) {
                // el is the selected item "option"
                $('#id_customer').val(el.data('cc'));
            });
        $('#selectactive').editableSelect()
            .on('select.editable-select', function (e, el) {
                // el is the selected item "option"
                $('#active').val(el.data('cc'));
            });
        $('#selectgender').editableSelect()
            .on('select.editable-select', function (e, el) {
                // el is the selected item "option"
                $('#gender').val(el.data('cc'));
            });
    });

</script>
</body>
</html>
