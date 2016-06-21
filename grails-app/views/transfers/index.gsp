
<%@ page import="com.skg.Transfers" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transfers.label', default: 'Transfers')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-transfers" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-transfers" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'transfers.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="created" title="${message(code: 'transfers.created.label', default: 'Created')}" />
					
						<g:sortableColumn property="currency" title="${message(code: 'transfers.currency.label', default: 'Currency')}" />
					
						<g:sortableColumn property="destinationId" title="${message(code: 'transfers.destinationId.label', default: 'Destination Id')}" />
					
						<g:sortableColumn property="fee" title="${message(code: 'transfers.fee.label', default: 'Fee')}" />
					
						<g:sortableColumn property="fundingSourceId" title="${message(code: 'transfers.fundingSourceId.label', default: 'Funding Source Id')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${transfersInstanceList}" status="i" var="transfersInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${transfersInstance.id}">${fieldValue(bean: transfersInstance, field: "amount")}</g:link></td>
					
						<td>${fieldValue(bean: transfersInstance, field: "created")}</td>
					
						<td>${fieldValue(bean: transfersInstance, field: "currency")}</td>
					
						<td>${fieldValue(bean: transfersInstance, field: "destinationId")}</td>
					
						<td>${fieldValue(bean: transfersInstance, field: "fee")}</td>
					
						<td>${fieldValue(bean: transfersInstance, field: "fundingSourceId")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${transfersInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
