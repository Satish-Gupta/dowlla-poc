<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fundingSource.label', default: 'FundingSource')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-fundingSource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-fundingSource" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${fundingSourceInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${fundingSourceInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form controller="fundingSource" action="verifyDeposit" >
				<g:hiddenField name="customerId" value="${customerId}"/>
				<g:hiddenField name="bankId" value="${bankId}"/>
				<fieldset class="form">
					<div class="fieldcontain">
						<label for="amount1">
							<g:message code="fundingSource.routingNumber.label" default="Amount 1" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="amount1" required="" value=""/>
					</div>
					<div class="fieldcontain">
						<label for="amount2">
							<g:message code="fundingSource.routingNumber.label" default="Amount 2" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="amount2" required="" value=""/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Verify" />
				</fieldset>
			</g:form>
		</div>

	</body>
</html>
