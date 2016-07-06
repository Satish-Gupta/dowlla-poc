<%@ page import="com.skg.Customer" %>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="customer.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${customerInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="customer.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${customerInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="customer.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${customerInstance?.lastName}"/>

</div>



<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'address1', 'error')} required">
	<label for="lastName">
		<g:message code="customer.lastName.label" default="Address " />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address1" required="" value="${customerInstance?.address1}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'city', 'error')} required">
	<label for="lastName">
		<g:message code="customer.lastName.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${customerInstance?.city}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'state', 'error')} required">
	<label for="lastName">
		<g:message code="customer.lastName.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="state" required="" value="${customerInstance?.state}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'ssn', 'error')} required">
	<label for="lastName">
		<g:message code="customer.lastName.label" default="Ssn" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ssn" required="" value="${customerInstance?.ssn}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'postalCode', 'error')} required">
	<label for="lastName">
		<g:message code="customer.lastName.label" default="Postal Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="postalCode" required="" value="${customerInstance?.postalCode}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'dateOfBirth', 'error')} required">
	<label for="lastName">
		<g:message code="customer.lastName.label" default="Date Of Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dateOfBirth" required="" value="${customerInstance?.dateOfBirth}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'phone', 'error')} required">
	<label for="lastName">
		<g:message code="customer.lastName.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${customerInstance?.phone}"/>

</div>