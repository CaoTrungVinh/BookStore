<%@ page import="Util.Util" %>
<div class="content-right">
    <h1 class="have-margin">
        Sổ địa chỉ

    </h1>
    <a class="add-address" href="<%= Util.fullPath("Account/add-adderss")%>"><i class="add"></i>
        <span>Thêm địa chỉ mới</span></a>

    <div class="dashboard-address">

        <div class="panel panel-default item is-default">
            <div class="panel-body">
                <p class="name">Nguyễn Văn Tánh <span class="default">Địa chỉ mặc định</span>
                </p>
                <p class="address"><span>Địa chỉ:</span> Đại Học Nông Lâm TpHCM, Phường Linh Trung, Quận Thủ Đức, Hồ Chí
                    Minh, Việt Nam</p>
                <p class="phone"><span>Điện thoại:</span> 0868374742</p>
                <p class="action">
                    <a class="btn btn-default btn-custom1 js-edit edit-customer-address "
                        href="https://tiki.vn/customer/address/edit?id=5588240&amp;_lc=Vk4wMzkwMjQwMDg%3D">Chỉnh sửa</a>
                </p>


            </div>
        </div>
        <div class="panel panel-default item">
            <div class="panel-body">
                <p class="name">Nguyễn Văn Tánh </p>
                <p class="address"><span>Địa chỉ:</span> 113/39b - Đường Số 11, Phường Linh Xuân, Quận Thủ Đức, Hồ Chí
                    Minh, Việt Nam</p>
                <p class="phone"><span>Điện thoại:</span> 0868374742</p>
                <p class="action">
                    <a class="btn btn-default btn-custom1 js-edit edit-customer-address "
                        href="https://tiki.vn/customer/address/edit?id=6482155&amp;_lc=Vk4wMzkwMjQwMDg%3D">Chỉnh sửa</a>
                    <a data-id="6482155" class="btn btn-default btn-custom1 btn-delete-address">Xóa</a>
                </p>


            </div>
        </div>
    </div>
</div>