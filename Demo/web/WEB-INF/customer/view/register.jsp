<%@ page import="Util.Util" %>
<!doctype html>
<html class="no-js" lang="">
<head>
    <title>Creat An Account || Witter Multipage Responsive Template</title>
    <jsp:include page="head.jsp"/>
</head>
<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Add your site or application content here -->
<!--Header Area Start-->
<jsp:include page="header.jsp"/>
<!--Header Area End-->
<!-- Mobile Menu Start -->
<!-- Mobile Menu End -->
<!-- Breadcrumbs Area Start -->
<div class="breadcrumbs-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="breadcrumbs">
                    <h2>REGISTER</h2>
                    <ul class="breadcrumbs-list">
                        <li>
                            <a title="Return to Home" href="../../../index.jsp">Home</a>
                        </li>
                        <li>Login</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs Area Start -->
<!-- Loging Area Start -->
<div class="login-account section-padding">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <form action="<%= Util.fullPath("Register")%>" class="create-account-form" method="post">
                    <h2 class="heading-title">
                        CREATE AN ACCOUNT
                    </h2>
                    <p class="form-row">
                        <input name="email" type="email" placeholder="Email address">
                    </p>
                    <p class="form-row">
                        <%= request.getAttribute("err-email") != null ? request.getAttribute("err-email") : ""%>
                    </p>
                    <p class="form-row">
                        <input name="username" type="text" placeholder="UserName">
                    </p>
                    <p class="form-row">
                        <input name="pass" type="password" placeholder="Password">
                    </p>
                    <p class="form-row">
                        <input name="re-pass" type="pass" placeholder="Password">
                    </p>
                    <p class="form-row">
                        <%= request.getAttribute("err-pass") != null ? request.getAttribute("err-pass") : ""%>
                    </p>
                    <p class="form-row">
                        <input name="phone" type="text" placeholder="Phone">
                    </p>
                    <div class="submit">
                        <button name="submitcreate" id="submitcreate" type="submit" class="btn-default">
                                    <span>
                                        <i class="fa fa-user left"></i>
                                        Create an account
                                    </span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Loging Area End -->
<!-- Footer Area Start -->
<jsp:include page="footer.jsp"/>
<!-- Footer Area End -->
<!-- all js here -->
<!-- jquery latest version -->
<jsp:include page="jquery.jsp"/>
</body>
</html>
