<%--
  Created by IntelliJ IDEA.
  User: Cao Trung Vinh
  Date: 11/11/2019
  Time: 22:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/public/customer/js/vendor/jquery-1.12.0.min.js" charset="utf-8"></script>
<!-- bootstrap js -->
<script src="/public/customer/js/bootstrap.min.js"></script>
<!-- owl.carousel js -->
<script src="/public/customer/js/owl.carousel.min.js"></script>
<!-- jquery-ui js -->
<script src="/public/customer/js/jquery-ui.min.js"></script>
<!-- jquery Counterup js -->
<script src="/public/customer/js/jquery.counterup.min.js"></script>
<script src="/public/customer/js/waypoints.min.js"></script>
<!-- jquery countdown js -->
<script src="/public/customer/js/jquery.countdown.min.js"></script>
<!-- jquery countdown js -->
<script type="text/javascript" src="/public/customer/venobox/venobox.min.js" charset="utf-8"></script>
<!-- jquery Meanmenu js -->
<script src="/public/customer/js/jquery.meanmenu.js" charset="utf-8"></script>
<!-- wow js -->
<script src="/public/customer/js/wow.min.js" charset="utf-8"></script>
<script>
    new WOW().init();
</script>
<!-- scrollUp JS -->
<script src="/public/customer/js/jquery.scrollUp.min.js"></script>
<!-- plugins js -->
<script src="/public/customer/js/plugins.js"></script>
<!-- Nivo slider js -->
<script src="/public/customer/lib/js/jquery.nivo.slider.js" type="text/javascript"></script>
<script src="/public/customer/lib/home.js" type="text/javascript"></script>
<!-- Google Map js -->
<!-- main js -->
<script language="JavaScript" src="/public/customer/js/main.js" charset="utf-8"></script>

<%--duyen--%>
<script src="https://cdn.jsdelivr.net/npm/bs-stepper/dist/js/bs-stepper.min.js"></script>
<script>
    var stepper1Node = document.querySelector('#stepper1')
    var stepper1 = new Stepper(document.querySelector('#stepper1'))

    stepper1Node.addEventListener('show.bs-stepper', function (event) {
        console.warn('show.bs-stepper', event)
    })
    stepper1Node.addEventListener('shown.bs-stepper', function (event) {
        console.warn('shown.bs-stepper', event)
    })

    var stepper2 = new Stepper(document.querySelector('#stepper2'), {
        linear: false,
        animation: true
    })
    var stepper3 = new Stepper(document.querySelector('#stepper3'), {
        animation: true
    })
    var stepper4 = new Stepper(document.querySelector('#stepper4'))
</script>
<script>
    function saveQuantity(quantity)
    {
        $.ajax({
            url:"/path/to/executing_script.php",
            type:"POST",
            data:{quantity : quantity}
            success:function(data){
                alert(data);
            }

        });
    }
</script>