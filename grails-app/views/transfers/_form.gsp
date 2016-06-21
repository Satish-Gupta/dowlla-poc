<%@ page import="com.skg.Transfers" %>



<div class="fieldcontain ${hasErrors(bean: transfersInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="transfers.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: transfersInstance, field: 'amount')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: transfersInstance, field: 'created', 'error')} required">
	<label for="created">
		<g:message code="transfers.created.label" default="Created" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="created" required="" value="${transfersInstance?.created}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transfersInstance, field: 'currency', 'error')} required">
	<label for="currency">
		<g:message code="transfers.currency.label" default="Currency" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="currency" required="" value="${transfersInstance?.currency}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transfersInstance, field: 'destinationId', 'error')} required">
	<label for="destinationId">
		<g:message code="transfers.destinationId.label" default="Destination Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="destinationId" required="" value="${transfersInstance?.destinationId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transfersInstance, field: 'fee', 'error')} required">
	<label for="fee">
		<g:message code="transfers.fee.label" default="Fee" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fee" value="${fieldValue(bean: transfersInstance, field: 'fee')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: transfersInstance, field: 'fundingSourceId', 'error')} required">
	<label for="fundingSourceId">
		<g:message code="transfers.fundingSourceId.label" default="Funding Source Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fundingSourceId" required="" value="${transfersInstance?.fundingSourceId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transfersInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="transfers.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${transfersInstance?.status}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transfersInstance, field: 'txnId', 'error')} required">
	<label for="txnId">
		<g:message code="transfers.txnId.label" default="Txn Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="txnId" required="" value="${transfersInstance?.txnId}"/>

</div>

