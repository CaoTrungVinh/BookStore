
<%@ page import="Util.Util" pageEncoding="utf-8" %>
<div class="content-right">
    <h1 class="have-margin">
        Your address

    </h1>
    <a class="add-address" href="<%= Util.fullPath("account/add-address")%>"><i class="add"></i>
        <span>Add new address</span></a>

    <div class="dashboard-address">

        <div class="panel panel-default item is-default">
            <div class="panel-body">
                <p class="name">Nguyễn Văn Tánh <span class="default">Default address</span>
                </p>
                <p class="address"><span>Address:</span> Đại Học Nông Lâm TpHCM, Phường Linh Trung, Quận Thủ Đức, Hồ Chí
                    Minh, Việt Nam</p>
                <p class="phone"><span>Phone number:</span> 0868374742</p>
                <p class="action">
                    <a class="btn btn-default btn-custom1 js-edit edit-customer-address "
                        href="https://tiki.vn/customer/address/edit?id=5588240&amp;_lc=Vk4wMzkwMjQwMDg%3D">Edit</a>
                </p>


            </div>
        </div>
        <div class="panel panel-default item">
            <div class="panel-body">
                <p class="name">Nguyễn Văn Tánh </p>
                <p class="address"><span>Address:</span> 113/39b - Đường Số 11, Phường Linh Xuân, Quận Thủ Đức, Hồ Chí
                    Minh, Việt Nam</p>
                <p class="phone"><span>Phone number:</span> 0868374742</p>
                <p class="action">
                    <a class="btn btn-default btn-custom1 js-edit edit-customer-address "
                        href="https://tiki.vn/customer/address/edit?id=6482155&amp;_lc=Vk4wMzkwMjQwMDg%3D">Edit</a>
                    <a data-id="6482155" class="btn btn-default btn-custom1 btn-delete-address">Delete</a>
                </p>


            </div>
        </div>
    </div>
</div>