<%@ page import="com.skg.FundingSource" %>



<div class="fieldcontain ${hasErrors(bean: fundingSourceInstance, field: 'accountNumber', 'error')} required">
	<label for="accountNumber">
		<g:message code="fundingSource.accountNumber.label" default="Account Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="accountNumber" required="" value="${fundingSourceInstance?.accountNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fundingSourceInstance, field: 'accountType', 'error')} required">
	<label for="accountType">
		<g:message code="fundingSource.accountType.label" default="Account Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="accountType" required="" value="${fundingSourceInstance?.accountType}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fundingSourceInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="fundingSource.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${fundingSourceInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fundingSourceInstance, field: 'routingNumber', 'error')} required">
	<label for="routingNumber">
		<g:message code="fundingSource.routingNumber.label" default="Routing Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="routingNumber" required="" value="${fundingSourceInstance?.routingNumber}"/>

</div>

