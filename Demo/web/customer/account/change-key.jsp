<%@ page import="Model.User" pageEncoding="utf-8" %>
<%@ page import="Util.Util" %>

<div class="content-right">

    <h1 class="have-margin">Account information</h1>

    <div class="account-profile register-form">

        <%--        <div><%=session.getAttribute("edit-account-noti")%>--%>
        <%--        </div>--%>
        <div style="height: 5px"></div>
        <% User user = (User) request.getAttribute("user");
            System.out.println(user.toString() + "dsdsd");
        %>
        <form class="content" action="<%= Util.fullPath("account/change-key?id="+user.getId()) %>"
              method="post" id="edit-account" name="frmQuantity" onChange="saveQuantity(this.value);">
            <div class="col-md-12 mt-5">
                <div id="stepper1" class="bs-stepper">
                    <div class="bs-stepper-header">
                        <div class="step" data-target="#test-l-1">
                            <button type="button" class="btn step-trigger">
                                <span class="bs-stepper-circle">1</span>
                                <span class="bs-stepper-label">Check information</span>
                            </button>
                        </div>
                        <%--                        <div class="line"></div>--%>
                        <%--                        <div class="step" data-target="#test-l-2">--%>
                        <%--                            <button type="button" class="btn step-trigger">--%>
                        <%--                                <span class="bs-stepper-circle">2</span>--%>
                        <%--                                <span class="bs-stepper-label">Check password</span>--%>
                        <%--                            </button>--%>
                        <%--                        </div>--%>
                        <div class="line"></div>
                        <div class="step" data-target="#test-l-3">
                            <button type="button" class="btn step-trigger">
                                <span class="bs-stepper-circle">3</span>
                                <span class="bs-stepper-label">Download file</span>
                            </button>
                        </div>
                        <div class="line"></div>
                        <div class="step" data-target="#test-l-4">
                            <button type="button" class="btn step-trigger">
                                <span class="bs-stepper-circle">4</span>
                                <span class="bs-stepper-label">Signature</span>
                            </button>
                        </div>
                        <div class="line"></div>
                        <div class="step" data-target="#test-l-5">
                            <button type="button" class="btn step-trigger">
                                <span class="bs-stepper-circle">5</span>
                                <span class="bs-stepper-label">Verification</span>
                            </button>
                        </div>
                    </div>
                    <div class="bs-stepper-content">

                        <div id="test-l-1" class="content">


                            <div class="form-group">
                                <label class="control-label">Full name</label>
                                <div class="input-wrap">
                                    <input type="text" name="name" class="form-control" id="name"
                                           value="<%= user.getUserName()%>">
                                    <span class="help-block"></span>
                                </div>
                                <label class="control-label">Email </label>
                                <div class="input-wrap">
                                    <input type="text" name="email" class="form-control" id="email"
                                           value="<%= user.getEmail()%>" placeholder="email">
                                    <span class="help-block"></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="phone">Phone number </label>
                                <div class="input-wrap">
                                    <input type="text" name="phone" class="form-control" id="phone"
                                           value="<%= user.getPhone()%>">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group gender-select-wrap" id="register_name">
                                <label class="control-label">Gender
                                </label>
                                <div class="input-wrap">
                                    <span class="help-block">Please choose your render</span>
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <label>
                                                <input type="radio" name="gender" value="Nam" id="gender_male"
                                                       class="gender" <% if ((user.getGender()!=null) && (user.getGender().equals("Nam"))) {%>
                                                       checked <% }  %>>
                                                Male
                                            </label>
                                        </div>
                                        <div class="col-xs-4">
                                            <label>
                                                <input type="radio" name="gender" value="Nữ" id="gender_female"
                                                       class="gender" <% if ((user.getGender()!=null) && user.getGender().equals("Nữ")) {%>
                                                       checked <% }  %>>
                                                Female
                                            </label>
                                        </div>

                                    </div>

                                </div>
                            </div>


                            <div class="form-group ">
                                <label class="control-label no-lh" for="dateofbirth">
                                    Birthday
                                </label>
                                <div class="input-wrap">
                                    <input class="form-control" type="date" name="dateofbirth" id="dateofbirth"
                                           value="<%=user.getDateofbirth()%>">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </div>

                        <%--                        <div id="test-l-2" class="content">--%>
                        <%--                            <p>Nhập lại mật khẩu: </p>--%>
                        <%--                            <input type="password" placeholder="password" name="password">--%>
                        <%--                            &lt;%&ndash;                            <button class="btn btn-primary" onclick="stepper1.next()">Next</button>&ndash;%&gt;--%>
                        <%--                        </div>--%>
                        <div id="test-l-3" class="content">
                            <div class="form-group">
                                <div class="input-wrap margin">
                                    <button class="btn btn-info btn-block" type="submit" name="download">
                                        <i class="fa fa-download"></i>Download File
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div id="test-l-4" class="content">
                            <div class="form-group">
                                <div class="input-wrap margin">
                                    <button class="btn btn-info btn-block" type="button">
                                        <a href="signtool://">
                                            <i class="fa fa-download"></i>Signature

                                        </a>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div id="test-l-5" class="content">
                            <div class="form-group">
                                <div class="input-wrap margin">
                                    <textarea rows="3" class="form-control" name="ver"></textarea>
                                    <button class="btn btn-info btn-block" type="submit" name="submit">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <button class="btn btn-primary" onclick="stepper1.previous()">Previous</button>
        <button class="btn btn-primary" onclick="stepper1.next()">Next</button>
    </div>
</div>
