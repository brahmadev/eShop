
<%@ page import="eshop.User" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
	<ul>
		<li><g:link class="home" controller="user" action="authenticate">Home</g:link></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
	</ul>
</div>
<div id="list-user" class="content scaffold-list" role="main">
	<h1><g:message code="default.list.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<table>
		<thead>
		<tr>

			<g:sortableColumn property="userName" title="${message(code: 'user.userName.label', default: 'User Name')}" />

			<g:sortableColumn property="password" title="${message(code: 'user.password.label', default: 'Password')}" />

			<g:sortableColumn property="role" title="${message(code: 'user.role.label', default: 'Role')}" />

			<g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}" />

		</tr>
		</thead>
		<tbody>
		<g:each in="${userInstanceList}" status="i" var="userInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "userName")}</g:link></td>

				<td>${fieldValue(bean: userInstance, field: "password")}</td>

				<td>${fieldValue(bean: userInstance, field: "role")}</td>

				<td>${fieldValue(bean: userInstance, field: "email")}</td>

			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${userInstanceTotal}" />
	</div>
</div>
</body>
</html>
