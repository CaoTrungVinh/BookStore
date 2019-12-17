<%@ page import="Util.Util" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="">
<head>
    <title>Forgot password</title>
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
<!-- Loging Area Start -->
<div class="login-account section-padding">
    <div class="container">
        <div class="row flex-center" >
            <div class="col-md-6 col-sm-6">
                <%--                       <form action="#" class="create-account-form" method="post">--%>
                <form action="<%= Util.fullPath("forgot-pass")%>" class="create-account-form text-center" method="post">
                    <h2 class="heading-title">
                       RESET PASSWORD
                    </h2>
                    <p>Enter your email, and we’ll send you instructions on how to reset your password.</p>
                    <p class="form-row">
                        <input type="email" name="email" placeholder="Email address">
                    </p>
                    <div class="form-group submit">
                        <button name="submitforgot" id="submitcforgot" type="submit" class="btn-default btn-block">
                                    <span>
                                        <i class="fa fa-user left"></i>
                                    Send me a reset instructions
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
