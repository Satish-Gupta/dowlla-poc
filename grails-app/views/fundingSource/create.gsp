<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fundingSource.label', default: 'FundingSource')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<script src="https://cdn.dwolla.com/1/dwolla.js"></script>
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
			<div id="mainContainer">
				<input type="button" id="start" value="Add Bank">
			</div>
			<div id="iavContainer"></div>
		</div>
		<script type="text/javascript">
			$('#start').click(function() {
				var iavToken = '4adF858jPeQ9RnojMHdqSD2KwsvmhO7Ti7cI5woOiBGCpH5krY';
				dwolla.configure('uat');
				dwolla.iav.start('iavContainer', iavToken, function(err, res) {
					console.log('Error: ' + JSON.stringify(err) + ' -- Response: ' + JSON.stringify(res));
				});
			});
		</script>
	</body>
</html>
