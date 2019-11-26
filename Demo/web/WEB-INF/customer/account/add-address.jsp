
<%@ page import="Util.Util" %>
<!doctype html>
<html class="no-js" lang="">
<head>
    <title>My Account</title>
    <jsp:include page="../view/head.jsp"/>
</head>
<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Add your site or application content here -->
<!--Header Area Start-->
<jsp:include page="../view/header.jsp"/>

<div class="content-right">
    <h1 class="have-margin">
        Tạo sổ địa chỉ
        <!-- <a href="#" class="add">Thêm địa chỉ mới</a> -->
    </h1>
    <div class="account-address-form address-form">
        <form class="form-horizontal bv-form" role="form" action="/customer/address/create"
            method="post" id="address-info" novalidate="novalidate"><button type="submit"
                class="bv-hidden-submit" style="display: none; width: 0px; height: 0px;"></button>
            <input type="hidden" name="TIKI_CSRF_TOKEN" value="TGxUUE5jTy9KZUdBdFhwY2hOMlVwZz09">

            <div class="form-group row  has-feedback">
                <label for="full_name"
                    class="col-lg-4 col-md-4 control-label visible-md-block visible-lg-block">Họ và
                    Tên:</label>
                <div class="col-lg-8 col-md-8">
                    <input name="full_name" type="text" class="form-control" id="full_name"
                        placeholder="Nhập họ và tên" value="Nguyễn Tánh" data-bv-field="full_name"><i
                        class="form-control-feedback" data-bv-icon-for="full_name"
                        style="display: none;"></i>
                    <small class="help-block" data-bv-validator="notEmpty" data-bv-for="full_name"
                        data-bv-result="NOT_VALIDATED" style="display: none;">Vui lòng nhập Họ
                        tên</small></div>
            </div>

            <div class="form-group row ">
                <label for="company"
                    class="col-lg-4 col-md-4 control-label visible-md-block visible-lg-block">Công
                    ty:</label>
                <div class="col-lg-8 col-md-8">
                    <input name="company" type="text" class="form-control" id="company"
                        placeholder="Nhập công ty" value="">
                </div>
            </div>

            <div class="form-group row  has-feedback">
                <label for="telephone"
                    class="col-lg-4 col-md-4 control-label visible-md-block visible-lg-block">Số điện
                    thoại:</label>
                <div class="col-lg-8 col-md-8">
                    <input name="telephone" type="tel" class="form-control" id="telephone"
                        placeholder="Nhập số điện thoại" value="" data-bv-field="telephone"><i
                        class="form-control-feedback" data-bv-icon-for="telephone"
                        style="display: none;"></i>
                    <small class="help-block" data-bv-validator="notEmpty" data-bv-for="telephone"
                        data-bv-result="NOT_VALIDATED" style="display: none;">Vui lòng nhập Số điện
                        thoại</small><small class="help-block" data-bv-validator="regexp"
                        data-bv-for="telephone" data-bv-result="NOT_VALIDATED" style="display: none;">Số
                        điện thoại không hợp lệ (chỉ chấp nhận
                        số)</small><small class="help-block" data-bv-validator="stringLength"
                        data-bv-for="telephone" data-bv-result="NOT_VALIDATED" style="display: none;">Số
                        điện thoại chỉ được chứa 9 - 15 chữ
                        số</small></div>
            </div>

            <div class="form-group row  has-feedback">
                <label for="region_id"
                    class="col-lg-4 col-md-4 control-label visible-md-block visible-lg-block">Tỉnh/Thành
                    phố:</label>

                <div class="col-lg-8 col-md-8">
                    <select name="region_id" class="form-control" id="region_id"
                        data-bv-field="region_id">
                        <option value="">Chọn Tỉnh/Thành phố</option>
                        <option value="294">Hồ Chí Minh</option>
                        <option value="297">Hà Nội</option>
                        <option value="291">Đà Nẵng</option>
                        <option value="278">An Giang</option>
                        <option value="280">Bà Rịa - Vũng Tàu</option>
                        <option value="282">Bắc Giang</option>
                        <option value="281">Bắc Kạn</option>
                        <option value="279">Bạc Liêu</option>
                        <option value="283">Bắc Ninh</option>
                        <option value="284">Bến Tre</option>
                        <option value="285">Bình Dương</option>
                        <option value="286">Bình Phước</option>
                        <option value="287">Bình Thuận</option>
                        <option value="316">Bình Định</option>
                        <option value="289">Cà Mau</option>
                        <option value="290">Cần Thơ</option>
                        <option value="288">Cao Bằng</option>
                        <option value="293">Gia Lai</option>
                        <option value="295">Hà Giang</option>
                        <option value="296">Hà Nam</option>
                        <option value="299">Hà Tĩnh</option>
                        <option value="300">Hải Dương</option>
                        <option value="301">Hải Phòng</option>
                        <option value="319">Hậu Giang</option>
                        <option value="302">Hoà Bình</option>
                        <option value="320">Hưng Yên</option>
                        <option value="321">Khánh Hòa</option>
                        <option value="322">Kiên Giang</option>
                        <option value="323">Kon Tum</option>
                        <option value="304">Lai Châu</option>
                        <option value="306">Lâm Đồng</option>
                        <option value="305">Lạng Sơn</option>
                        <option value="324">Lào Cai</option>
                        <option value="325">Long An</option>
                        <option value="326">Nam Định</option>
                        <option value="327">Nghệ An</option>
                        <option value="307">Ninh Bình</option>
                        <option value="328">Ninh Thuận</option>
                        <option value="329">Phú Thọ</option>
                        <option value="308">Phú Yên</option>
                        <option value="309">Quảng Bình</option>
                        <option value="310">Quảng Nam</option>
                        <option value="311">Quảng Ngãi</option>
                        <option value="330">Quảng Ninh</option>
                        <option value="312">Quảng Trị</option>
                        <option value="313">Sóc Trăng</option>
                        <option value="331">Sơn La</option>
                        <option value="332">Tây Ninh</option>
                        <option value="333">Thái Bình</option>
                        <option value="334">Thái Nguyên</option>
                        <option value="335">Thanh Hóa</option>
                        <option value="303">Thừa Thiên Huế</option>
                        <option value="336">Tiền Giang</option>
                        <option value="314">Trà Vinh</option>
                        <option value="315">Tuyên Quang</option>
                        <option value="337">Vĩnh Long</option>
                        <option value="338">Vĩnh Phúc</option>
                        <option value="339">Yên Bái</option>
                        <option value="292">Đắk Lắk</option>
                        <option value="340">Đắk Nông</option>
                        <option value="341">Điện Biên</option>
                        <option value="317">Đồng Nai</option>
                        <option value="318">Đồng Tháp</option>
                    </select><i class="form-control-feedback" data-bv-icon-for="region_id"
                        style="display: none;"></i>
                    <small class="help-block" data-bv-validator="notEmpty" data-bv-for="region_id"
                        data-bv-result="NOT_VALIDATED" style="display: none;">Vui lòng chọn Tỉnh/Thành
                        phố</small></div>
            </div>


            <div class="form-group  has-feedback">
                <label for="city_id"
                    class="col-lg-4 col-md-4 control-label visible-md-block visible-lg-block">Quận
                    huyện:</label>

                <div class="col-lg-8 col-md-8">
                    <select name="city_id" class="form-control" id="city_id" data-bv-field="city_id">
                        <option value="">Chọn Quận/Huyện</option>
                    </select><i class="form-control-feedback" data-bv-icon-for="city_id"
                        style="display: none;"></i>
                    <small class="help-block" data-bv-validator="notEmpty" data-bv-for="city_id"
                        data-bv-result="NOT_VALIDATED" style="display: none;">Vui lòng chọn
                        Quận/Huyện</small></div>
            </div>

            <div class="form-group  has-feedback">
                <label for="ward_id"
                    class="col-lg-4 col-md-4 control-label visible-md-block visible-lg-block">Phường
                    xã:</label>

                <div class="col-lg-8 col-md-8">
                    <select name="ward_id" class="form-control" id="ward_id" data-bv-field="ward_id">
                        <option value="">Chọn Phường/Xã</option>
                    </select><i class="form-control-feedback" data-bv-icon-for="ward_id"
                        style="display: none;"></i>
                    <small class="help-block" data-bv-validator="notEmpty" data-bv-for="ward_id"
                        data-bv-result="NOT_VALIDATED" style="display: none;">Vui lòng chọn
                        Phường/Xã</small></div>
            </div>

            <div class="form-group row  has-feedback">
                <label for="street"
                    class="col-lg-4 col-md-4 control-label visible-md-block visible-lg-block">Địa
                    chỉ:</label>
                <div class="col-lg-8 col-md-8">
                    <textarea class="form-control" id="street" name="street" cols="30" rows="10"
                        placeholder="Nhập địa chỉ" data-bv-field="street"></textarea><i
                        class="form-control-feedback" data-bv-icon-for="street"
                        style="display: none;"></i>
                    <small class="help-block" data-bv-validator="notEmpty" data-bv-for="street"
                        data-bv-result="NOT_VALIDATED" style="display: none;">Vui lòng nhập Địa
                        chỉ</small><small class="help-block" data-bv-validator="regexp"
                        data-bv-for="street" data-bv-result="NOT_VALIDATED" style="display: none;">Địa
                        chỉ của bạn không hợp lệ </small>
                </div>
            </div>
            <div class="form-group row form-group-radio group-radio-k-address">
                <label class="col-lg-4 control-label visible-lg-block">Loại địa chỉ</label>
                <div class="col-lg-8 input-wrap">
                    <div class="radio radio-float" style="width: 50%;float: left;">
                        <label for="delivery_address_type_2"><input type="radio"
                                name="delivery_address_type" value="1" checked>Nhà riêng / Chung
                            cư</label>
                    </div>
                    <div class="radio radio-float" style="width: 50%;float: left;">
                        <label for="delivery_address_type_2"><input type="radio"
                                name="delivery_address_type" value="2">Cơ quan / Công ty</label>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-lg-offset-4 col-md-offset-4 col-lg-8 col-md-8">
                    <label class="checkbox-inline">
                        <input name="default_shipping_address" type="checkbox" value="1">Sử dụng địa chỉ
                        này làm mặc định.
                    </label>
                </div>
            </div>

            <div class="form-group row end">
                <div class="col-lg-offset-4 col-md-offset-4 col-lg-8 col-md-8">
                    <button type="submit" class="btn btn-info btn-update">Cập nhật</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- Loging Area End -->
<!-- Footer Area Start -->
<jsp:include page="../view/footer.jsp"/>
<!-- Footer Area End -->
<!-- all js here -->
<!-- jquery latest version -->
<jsp:include page="../view/jquery.jsp"/>
</body>
</html>