<!DOCTYPE html>
<html lang="en">
<head>
    <title>Accounts - Product Admin Template</title>
    <jsp:include page="head.jsp"/>
</head>

<body id="reportsPage">
<div class="" id="home">
    <jsp:include page="header.jsp"/>

    <div class="container mt-5">
        <div class="row tm-content-row">
            <div class="col-12 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <h2 class="tm-block-title">List of Accounts</h2>
                    <p class="text-white">Accounts</p>
                    <select class="custom-select">
                        <option value="0">Select account</option>
                        <option value="1">Admin</option>
                        <option value="4">Customer</option>
                    </select>
                </div>
            </div>
        </div>
        <!-- row -->
        <div class="row tm-content-row">
            <div class="tm-block-col tm-col-avatar">
                <div class="tm-bg-primary-dark tm-block tm-block-avatar">
                    <h2 class="tm-block-title">Change Avatar</h2>
                    <div class="tm-avatar-container">
                        <img
                                src="public/admin/img/avatar.png"
                                alt="Avatar"
                                class="tm-avatar img-fluid mb-4"
                        />
                        <a href="#" class="tm-avatar-delete-link">
                            <i class="far fa-trash-alt tm-product-delete-icon"></i>
                        </a>
                    </div>
                    <button class="btn btn-primary btn-block text-uppercase">
                        Upload New Photo
                    </button>
                </div>
            </div>
            <div class="tm-block-col tm-col-account-settings">
                <div class="tm-bg-primary-dark tm-block tm-block-settings">
                    <h2 class="tm-block-title">Account Settings</h2>
                    <form action="" class="tm-signup-form row">
                        <div class="form-group col-lg-6">
                            <label for="name">Account Name</label>
                            <input
                                    id="name"
                                    name="name"
                                    type="text"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="email">Account Email</label>
                            <input
                                    id="email"
                                    name="email"
                                    type="email"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="password">Password</label>
                            <input
                                    id="password"
                                    name="password"
                                    type="password"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="password2">Re-enter Password</label>
                            <input
                                    id="password2"
                                    name="password2"
                                    type="password"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="phone">Phone</label>
                            <input
                                    id="phone"
                                    name="phone"
                                    type="tel"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label class="tm-hide-sm">&nbsp;</label>
                            <button
                                    type="submit"
                                    class="btn btn-primary btn-block text-uppercase"
                            >
                                Update Your Profile
                            </button>
                        </div>
                        <div class="col-12">
                            <button
                                    type="submit"
                                    class="btn btn-primary btn-block text-uppercase"
                            >
                                Delete Your Account
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"/>
</div>

<script src="/public/admin/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="/public/admin/js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
</body>
</html>
