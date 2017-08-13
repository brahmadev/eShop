<%--
  Created by IntelliJ IDEA.
  User: Brahmastra
  Date: 7/30/2017
  Time: 5:32 AM
--%>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <title>Online shopping </title>
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
                <g:link controller="product" action="showCart"><span class="icon-shopping-cart"><span class='cartitem'></span> Item(s) - Rs<span  class='total-price'>0</span></g:link>
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

    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="nav-collapse">
                    <ul class="nav">
                        <li><g:link controller="product" action="productDetails">Home	</g:link></li>
                        <li><g:link controller="product" action="search" params="[name:'computer']">Computers</g:link></li>
                        <li><g:link controller="product" action="search" params="[name:'Household']">Households</g:link></li>
                        <li><g:link controller="product" action="search" params="[name:'Kitchen']">Kitchen stuffs</g:link></li>
                        <li><g:link controller="product" action="search" params="[name:'Music']">Music Instruments</g:link></li>
                       %{-- <li><g:form controller="product" action="searchPrice">
                            <select name="priceSelect" style="width: 50px;">
                            <option value="atLeast">At least</option>
                            <option value="exactly">Exactly</option>
                            <option value="atMost">At Most</option>
                        </select>
                            Rs
                            <input type="text" name="price" style="width: 60px;"/>
                            <input type="submit" value="searchPrice" style="align-self: baseline"/>
                            </g:form>
                        </li>--}%

                    </ul>
                   %{-- <form action="#" class="navbar-search pull-right">
                        <input type="text" placeholder="Search" class="search-query span2">
                    </form>--}%
                    <g:form class="navbar-form pull-right form-search" controller="product" action="searchBar">
                        <div class="input-append">
                            <i class="icon-zoom-in"></i>
                            <input name="name" data-items="4"  type="text"
                                   class="span2 search-query">
                            <input type="submit" class="btn" value="search"/>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>

<!--
Three column view
-->
<h3>Our Products </h3>
<ul class="thumbnails">
<g:each in="${productList}" status="i" var="products">
<li class="span3">
    <div class="thumbnail">
        <p >${products.category}</p>
        <img src="${resource(dir: 'images/products', file: "${products.imagePath}")}" height="100px" width="100px">
        <div class="caption cntr">
            <p >${products.manufacturer}</p>
            <p >${products.name}</p>
            <p><strong><g:dwitNumberFormat number="${products.price}" format="Rs##0.00"/></strong></p>
            <h4><a class="add-to-cart shopBtn" href="#" title="add to cart" product-id="${products.id}" product-price="${products.price}" product-name="${products.name}" product-image="${products.imagePath}" product-brand="${products.manufacturer}"> Add to cart </a></h4>
            %{--<input type="button" value="Add" onclick="addToCart('i')">--}%
            <br class="clr">
        </div>
    </div>
</li>
    </g:each>
</ul>


<!-- /container -->

<div class="copyright">
    <div class="container">
        <p class="pull-right">

            <a href="#" ><img  src="${resource(dir: 'images', file: 'maestro.png')}"></a>
            <a href="#" ><img  src="${resource(dir: 'images', file: 'mc.png')}"></a>
            <a href="#" ><img  src="${resource(dir: 'images', file: 'pp.png')}"></a>
            <a href="#" ><img  src="${resource(dir: 'images', file: 'visa.png')}"></a>
            <a href="#" ><img  src="${resource(dir: 'images', file: 'disc.png')}"></a>
        </p>
        <span>Copyright &copy; brahma 2017<br> brahmastra soft</span>
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

<!-- cart-js -->
<g:javascript src="minicart.js"/>
%{--<script>
    w3ls.render();

    w3ls.cart.on('w3sb_checkout', function (evt) {
        var items, len, i;

        if (this.subtotal() > 0) {
            items = this.items();

            for (i = 0, len = items.length; i < len; i++) {
            }
        }
    });
</script>--}%
<!-- //cart-js -->
</body>
</html>