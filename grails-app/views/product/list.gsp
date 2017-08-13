
<%@ page import="eshop.Product" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
	<ul>
		<li><g:link class="home" controller="user" action="authenticate">Home</g:link></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
	</ul>
</div>
<div id="list-product" class="content scaffold-list" role="main">
	<h1><g:message code="default.list.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<table>
		<thead>
		<tr>

			<th><g:message code="product.category.label" default="Category" /></th>

			<g:sortableColumn property="imagePath" title="${message(code: 'product.image.label', default: 'Image')}" />

			<g:sortableColumn property="manufacturer" title="${message(code: 'product.manufacturer.label', default: 'Manufacturer')}" />

			<g:sortableColumn property="name" title="${message(code: 'product.name.label', default: 'Name')}" />

			<g:sortableColumn property="price" title="${message(code: 'product.price.label', default: 'Price')}" />

			<g:sortableColumn property="quantity" title="${message(code: 'product.quantity.label', default: 'Quantity')}" />

		</tr>
		</thead>
		<tbody>
		<g:each in="${productInstanceList}" status="i" var="productInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "category")}</g:link></td>

				<td>${fieldValue(bean: productInstance, field: "imagePath")}</td>

				<td>${fieldValue(bean: productInstance, field: "manufacturer")}</td>

				<td>${fieldValue(bean: productInstance, field: "name")}</td>


				%{--<td>${fieldValue(bean: productInstance, field: "price")}</td>--}%
				<td><g:dwitNumberFormat number="${productInstance.price}" format="Rs##0.00"/> </td>

				<td>${fieldValue(bean: productInstance, field: "quantity")}</td>

			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${productInstanceTotal}" />
	</div>
</div>
</body>
</html>
