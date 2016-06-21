
<%@ page import="com.skg.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-customer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'customer.type.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'customer.address1.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'customer.address2.label', default: 'Email')}" />
					
						<g:sortableColumn property="ipAddress" title="${message(code: 'customer.city.label', default: 'Ip address')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerInstanceList}" status="i" var="customerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td>${fieldValue(bean: customerInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: customerInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: customerInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: customerInstance, field: "ipAddress")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${customerInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
