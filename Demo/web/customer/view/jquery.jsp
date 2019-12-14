<%--
  Created by IntelliJ IDEA.
  User: Cao Trung Vinh
  Date: 11/11/2019
  Time: 22:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/public/customer/js/vendor/jquery-1.12.0.min.js"></script>
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
<script type="text/javascript" src="/public/customer/venobox/venobox.min.js"></script>
<!-- jquery Meanmenu js -->
<script src="/public/customer/js/jquery.meanmenu.js"></script>
<!-- wow js -->
<script src="/public/customer/js/wow.min.js"></script>
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
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script>
    function initialize() {
        var mapOptions = {
            zoom: 16,
            scrollwheel: false,
            center: new google.maps.LatLng(23.763474, 90.431483)
        };
        var map = new google.maps.Map(document.getElementById('googleMap'),
            mapOptions);
        var marker = new google.maps.Marker({
            position: map.getCenter(),
            animation:google.maps.Animation.BOUNCE,
            icon: 'img/map-icon.png',
            map: map
        });
    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>
<!-- main js -->
<script src="/public/customer/js/main.js"></script>
