<%--
  Created by IntelliJ IDEA.
  User: Brahmastra
  Date: 7/30/2017
  Time: 6:52 PM
--%>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <title>shopping cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap styles -->
    %{--<link href="/../../../web-app/css/bootstrap.css" rel="stylesheet"/>--}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <!-- Customize styles -->

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
    <!-- font awesome styles -->

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.css')}" type="text/css">
    %{--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--}%


    <!-- Favicons -->

    <link rel="shortcut icon" href="${resource(dir: 'ico', file: 'font-awesome.css')}">

</head>
<body>
<!--
	Upper Header Section
-->
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="topNav">
        <div class="container">
            <div class="alignR">
                <div class="pull-left socialNw">
                    <a href="#"><span class="icon-twitter"></span></a>
                    <a href="#"><span class="icon-facebook"></span></a>
                    <a href="#"><span class="icon-youtube"></span></a>
                    <a href="#"><span class="icon-tumblr"></span></a>
                </div>
                <g:link controller="product" action="productDetails"> <span class="icon-home"></span> Home</g:link>
                <g:link controller="user" action="loginForm"><span class="icon-user"></span>Login</g:link>


                <g:link controller="product" action="showCart"><span class="icon-shopping-cart"><span class='cartitem'></span> Item(s) - Rs<span class='total-price badge badge-warning'>0</span></g:link>
            </div>
        </div>
    </div>
</div>

<!--
Lower Header Section
-->
<div class="container">
    <div id="gototop"> </div>
    <header id="header">
        <div class="row">
            <div class="span4">
                <h1>
                    <a class="logo" href="#"><span>Twitter Bootstrap ecommerce template</span>

                        <img  src="${resource(dir: 'images', file: 'logo-bootstrap-shoping-cart.png')}">
                    </a>
                </h1>
            </div>
        </div>
    </header>



    <!--
Three column view
-->
    <div class="row">
        <div class="span12">

            <div class="well well-small">
                <h1>Check Out <small class="pull-right"><span class='cartitem'></span> Item(s)are in the cart </small></h1>
                <hr class="soften"/>

                <table class="table table-bordered table-condensed">
                    <thead>
                    <tr>
                        <th>Product</th>
                        <th>Description</th>
                        <th>Unit price</th>
                        <th>Qty </th>
                        <th>Total</th>
                    </tr>
                    </thead>
                    <tbody id="mtable-body">



                    </tbody>
                    <tr><td colspan="4" class="alignR">Total price to pay:</td><td class="label label-primary " align="center" >Rs<span class='total-price'>0</span></td></tr>
                </table><br/>





                <g:link controller="product" action="productDetails" class="shopBtn btn-large"><span class="icon-arrow-left"></span> Continue Shopping </g:link>
                <g:form controller="product" action="sendEmail" class="shopBtn btn-large pull-right">
                    <input id="cart-data" type="hidden" name="cartData" value="">
                    <input type="submit" value="Send Email" class="shopBtn">
                    </g:form>

            </div>
        </div>
    </div>




</div><!-- /container -->

<div class="copyright">
    <div class="container">
        <p class="pull-right">
            <a href="#"><img src="../images/maestro.png" alt="payment"></a>
            <a href="#"><img src="../images/mc.png" alt="payment"></a>
            <a href="#"><img src="../images/pp.png" alt="payment"></a>
            <a href="#"><img src="../images/visa.png" alt="payment"></a>
            <a href="#"><img src="../images/disc.png" alt="payment"></a>
        </p>
        <span>Copyright &copy;  brahma 2017<br> brahmastra soft</span>
    </div>
</div>
<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
<!-- Placed at the end of the document so the pages load faster -->
<g:javascript src="jquery.js"/>
<g:javascript src="bootstrap.min.js"/>
<g:javascript src="jquery.easing-1.3.min.js"/>
<g:javascript src="jquery.scrollTo-1.4.3.1-min.js"/>
<g:javascript src="shop.js"/>
<g:javascript src="custom.js"/>
</body>
</html>