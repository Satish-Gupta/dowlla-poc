<%@ page import="com.skg.Transfers" %>



<div class="fieldcontain ${hasErrors(bean: transfersInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="transfers.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: transfersInstance, field: 'amount')}" required=""/>

</div>

%{--<div class="fieldcontain ${hasErrors(bean: transfersInstance, field: 'currency', 'error')} required">--}%
	%{--<label for="currency">--}%
		%{--<g:message code="transfers.currency.label" default="Currency" />--}%
		%{--<span class="required-indicator">*</span>--}%
	%{--</label>--}%
	%{--<g:textField name="currency" required="" value="${transfersInstance?.currency}"/>--}%

%{--</div>--}%

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
	<select id="bank" name="fundingSource" value="${it?.name}">
		<g:each in="${bankList}" var="bank">
			<option value="${bank?.id}">${bank?.name}</option>
		</g:each>
	</select>
</div>

