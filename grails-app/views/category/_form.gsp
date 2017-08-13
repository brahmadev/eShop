<%@ page import="eshop.Category" %>



<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="category.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${categoryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="category.type.label" default="Type" />
		
	</label>
	<g:textField name="type" value="${categoryInstance?.type}"/>
</div>

