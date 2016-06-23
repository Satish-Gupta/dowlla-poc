
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
					
						<g:sortableColumn property="id" title="${message(code: 'fundingSource.accountNumber.label', default: 'Account Number')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'fundingSource.accountType.label', default: 'Account Type')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'fundingSource.name.label', default: 'Name')}" />

						<g:sortableColumn property="status" title="${message(code: 'fundingSource.name.label', default: 'Status')}" />

						<g:sortableColumn property="name" title="${message(code: 'fundingSource.name.label', default: 'action')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${bankList}" status="i" var="bank">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${bank.id}">${bank.id}</g:link></td>

						<td>${bank.name}</td>

						<td>${bank.type}</td>

						<td>${bank.status}</td>
						<td>
							<g:if test="${bank.status == "unverified"}">
								<g:link controller="fundingSource" action="showDeposit" params="${[bankId:bank.id,customerId:customerInstance.id]}">Verify</g:link>
							</g:if>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
