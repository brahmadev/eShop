<%--
  Created by IntelliJ IDEA.
  User: Brahmastra
  Date: 7/29/2017
  Time: 3:04 PM
--%>

<%@ page import="eshop.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title>adminPanel</title>
</head>
<body>
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><g:link class ="home"controller="product" action="productDetails">Home</g:link></li>
        <li><g:link controller="user" >User</g:link></li>
        <li><g:link controller="product" >Products</g:link></li>
        <li><g:link controller="category">categories</g:link></li>
        <li><g:link controller="user" action="logout">Logout</g:link></li>
    </ul>

</div>
<h4> this is first page</h4>

</body>
</html>