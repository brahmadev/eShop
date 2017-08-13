
<%@ page import="eshop.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-product" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list product">
			
				<g:if test="${productInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="product.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${productInstance?.category?.id}">${productInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.imagePath}">
				<li class="fieldcontain">
					<img src="${resource(dir: 'images/products', file: "${productInstance.imagePath}")}" height="72px" width="72px" />
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.manufacturer}">
				<li class="fieldcontain">
					<span id="manufacturer-label" class="property-label"><g:message code="product.manufacturer.label" default="Manufacturer" /></span>
					
						<span class="property-value" aria-labelledby="manufacturer-label"><g:fieldValue bean="${productInstance}" field="manufacturer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="product.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="product.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${productInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="product.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${productInstance}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.serialNumber}">
				<li class="fieldcontain">
					<span id="serialNumber-label" class="property-label"><g:message code="product.serialNumber.label" default="Serial Number" /></span>
					
						<span class="property-value" aria-labelledby="serialNumber-label"><g:fieldValue bean="${productInstance}" field="serialNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="product.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${productInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productInstance?.id}" />
					<g:link class="edit" action="edit" id="${productInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
