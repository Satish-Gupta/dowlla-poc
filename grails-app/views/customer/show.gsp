
<%@ page import="com.skg.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<script src="https://cdn.dwolla.com/1/dwolla.js"></script>
	</head>
	<body>
		<a href="#show-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-customer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list customer">
			
				<g:if test="${customerInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="customer.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${customerInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.address1}">
				<li class="fieldcontain">
					<span id="address1-label" class="property-label"><g:message code="customer.address1.label" default="Address1" /></span>
					
						<span class="property-value" aria-labelledby="address1-label"><g:fieldValue bean="${customerInstance}" field="address1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.address2}">
				<li class="fieldcontain">
					<span id="address2-label" class="property-label"><g:message code="customer.address2.label" default="Address2" /></span>
					
						<span class="property-value" aria-labelledby="address2-label"><g:fieldValue bean="${customerInstance}" field="address2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="customer.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${customerInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="customer.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${customerInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.postalCode}">
				<li class="fieldcontain">
					<span id="postalCode-label" class="property-label"><g:message code="customer.postalCode.label" default="Postal Code" /></span>
					
						<span class="property-value" aria-labelledby="postalCode-label"><g:fieldValue bean="${customerInstance}" field="postalCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.dateOfBirth}">
				<li class="fieldcontain">
					<span id="dateOfBirth-label" class="property-label"><g:message code="customer.dateOfBirth.label" default="Date Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="dateOfBirth-label"><g:fieldValue bean="${customerInstance}" field="dateOfBirth"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.ssn}">
				<li class="fieldcontain">
					<span id="ssn-label" class="property-label"><g:message code="customer.ssn.label" default="Ssn" /></span>
					
						<span class="property-value" aria-labelledby="ssn-label"><g:fieldValue bean="${customerInstance}" field="ssn"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="customer.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${customerInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="customer.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${customerInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="customer.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${customerInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.ipAddress}">
				<li class="fieldcontain">
					<span id="ipAddress-label" class="property-label"><g:message code="customer.ipAddress.label" default="Ip Address" /></span>
					
						<span class="property-value" aria-labelledby="ipAddress-label"><g:fieldValue bean="${customerInstance}" field="ipAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="customer.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${customerInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.verified}">
				<li class="fieldcontain">
					<span id="verified-label" class="property-label"><g:message code="customer.verified.label" default="Verified" /></span>
					
						<span class="property-value" aria-labelledby="verified-label"><g:formatBoolean boolean="${customerInstance?.verified}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:customerInstance, action:'delete']" method="DELETE">
				<div id="mainContainer">
					<input type="button" id="start" value="Add Bank">
				</div>

				<div id="iavContainer"></div>
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${customerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:link class="edit" controller="transfers" action="create">Send Money</g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	<script type="text/javascript">
		$('#start').click(function() {
			var iavToken = '${iavToken}';
			dwolla.configure('uat');
			dwolla.iav.start('iavContainer', iavToken, function(err, res) {
				console.log('Error: ' + JSON.stringify(err) + ' -- Response: ' + JSON.stringify(res));
			});
		});
	</script>
	</body>
</html>
