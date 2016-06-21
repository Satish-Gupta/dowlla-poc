
<%@ page import="com.skg.FundingSource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fundingSource.label', default: 'FundingSource')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-fundingSource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-fundingSource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="accountNumber" title="${message(code: 'fundingSource.accountNumber.label', default: 'Account Number')}" />
					
						<g:sortableColumn property="accountType" title="${message(code: 'fundingSource.accountType.label', default: 'Account Type')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'fundingSource.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="routingNumber" title="${message(code: 'fundingSource.routingNumber.label', default: 'Routing Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fundingSourceInstanceList}" status="i" var="fundingSourceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${fundingSourceInstance.id}">${fieldValue(bean: fundingSourceInstance, field: "accountNumber")}</g:link></td>
					
						<td>${fieldValue(bean: fundingSourceInstance, field: "accountType")}</td>
					
						<td>${fieldValue(bean: fundingSourceInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: fundingSourceInstance, field: "routingNumber")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fundingSourceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
