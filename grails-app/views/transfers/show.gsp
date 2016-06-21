
<%@ page import="com.skg.Transfers" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transfers.label', default: 'Transfers')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-transfers" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-transfers" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list transfers">
			
				<g:if test="${transfersInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="transfers.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${transfersInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transfersInstance?.created}">
				<li class="fieldcontain">
					<span id="created-label" class="property-label"><g:message code="transfers.created.label" default="Created" /></span>
					
						<span class="property-value" aria-labelledby="created-label"><g:fieldValue bean="${transfersInstance}" field="created"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transfersInstance?.currency}">
				<li class="fieldcontain">
					<span id="currency-label" class="property-label"><g:message code="transfers.currency.label" default="Currency" /></span>
					
						<span class="property-value" aria-labelledby="currency-label"><g:fieldValue bean="${transfersInstance}" field="currency"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transfersInstance?.destinationId}">
				<li class="fieldcontain">
					<span id="destinationId-label" class="property-label"><g:message code="transfers.destinationId.label" default="Destination Id" /></span>
					
						<span class="property-value" aria-labelledby="destinationId-label"><g:fieldValue bean="${transfersInstance}" field="destinationId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transfersInstance?.fee}">
				<li class="fieldcontain">
					<span id="fee-label" class="property-label"><g:message code="transfers.fee.label" default="Fee" /></span>
					
						<span class="property-value" aria-labelledby="fee-label"><g:fieldValue bean="${transfersInstance}" field="fee"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transfersInstance?.fundingSourceId}">
				<li class="fieldcontain">
					<span id="fundingSourceId-label" class="property-label"><g:message code="transfers.fundingSourceId.label" default="Funding Source Id" /></span>
					
						<span class="property-value" aria-labelledby="fundingSourceId-label"><g:fieldValue bean="${transfersInstance}" field="fundingSourceId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transfersInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="transfers.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${transfersInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transfersInstance?.txnId}">
				<li class="fieldcontain">
					<span id="txnId-label" class="property-label"><g:message code="transfers.txnId.label" default="Txn Id" /></span>
					
						<span class="property-value" aria-labelledby="txnId-label"><g:fieldValue bean="${transfersInstance}" field="txnId"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:transfersInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${transfersInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
