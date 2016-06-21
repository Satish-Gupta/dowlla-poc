
<%@ page import="com.skg.FundingSource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fundingSource.label', default: 'FundingSource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-fundingSource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-fundingSource" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list fundingSource">
			
				<g:if test="${fundingSourceInstance?.accountNumber}">
				<li class="fieldcontain">
					<span id="accountNumber-label" class="property-label"><g:message code="fundingSource.accountNumber.label" default="Account Number" /></span>
					
						<span class="property-value" aria-labelledby="accountNumber-label"><g:fieldValue bean="${fundingSourceInstance}" field="accountNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fundingSourceInstance?.accountType}">
				<li class="fieldcontain">
					<span id="accountType-label" class="property-label"><g:message code="fundingSource.accountType.label" default="Account Type" /></span>
					
						<span class="property-value" aria-labelledby="accountType-label"><g:fieldValue bean="${fundingSourceInstance}" field="accountType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fundingSourceInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="fundingSource.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${fundingSourceInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fundingSourceInstance?.routingNumber}">
				<li class="fieldcontain">
					<span id="routingNumber-label" class="property-label"><g:message code="fundingSource.routingNumber.label" default="Routing Number" /></span>
					
						<span class="property-value" aria-labelledby="routingNumber-label"><g:fieldValue bean="${fundingSourceInstance}" field="routingNumber"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:fundingSourceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${fundingSourceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
