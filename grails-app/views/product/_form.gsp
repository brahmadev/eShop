<%@ page import="eshop.Product" %>



<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="product.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${eshop.Category.list()}" optionKey="id" required="" value="${productInstance?.category?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'image', 'error')} required">
	<label for="image">
		<g:message code="product.image.label" default="Image" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="image" name="image" />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'manufacturer', 'error')} ">
	<label for="manufacturer">
		<g:message code="product.manufacturer.label" default="Manufacturer" />
		
	</label>
	<g:textField name="manufacturer" value="${productInstance?.manufacturer}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="product.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${productInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="product.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: productInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="product.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" type="number" value="${productInstance.quantity}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'serialNumber', 'error')} ">
	<label for="serialNumber">
		<g:message code="product.serialNumber.label" default="Serial Number" />
		
	</label>
	<g:textField name="serialNumber" value="${productInstance?.serialNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="product.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${productInstance?.status}"/>
</div>

