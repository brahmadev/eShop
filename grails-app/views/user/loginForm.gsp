<%--
  Created by IntelliJ IDEA.
  User: Brahmastra
  Date: 7/26/2017
  Time: 5:55 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link href="../css/login.css" rel="stylesheet">
    <title></title>
</head>

<body>
<div class="login">
    <h1>Login</h1>
<g:form >
    <label>User Name: </label>
    <g:textField name="userName" required="required"/><br/>
    <label>Password: </label>
    <g:passwordField name="password" required="required"/><br/>
%{--<input type="submit" value="login">--}%
    <g:actionSubmit action="login" value="Log In"/>
</g:form>
    </div>
</body>
</html>