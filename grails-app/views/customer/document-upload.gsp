<%--
  Created by IntelliJ IDEA.
  User: satish
  Date: 7/4/16
  Time: 5:06 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:form url="[resource:customerInstance, action:'save']" enctype="multipart/form-data">
    <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'email', 'error')} required">
        <label for="email">
            <g:message code="customer.email.label" default="Email" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="email" required="" value="${customerInstance?.email}"/>

    </div>
    <div class="fieldcontain required">
        <label for="document">
            <g:message code="customer.email.label" default="Document" />
            <span class="required-indicator">*</span>
        </label>
        <input type="file" name="document" />
    </div>
    <div class="fieldcontain required">
        <label for="documentType">
        <g:message code="customer.email.label" default="Document Type" />
        <span class="required-indicator">*</span>
        </label>
        <g:textField name="documentType" value="passport"/>
    </div>
<fieldset class="buttons">
    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
    <g:submitButton name="verify" class="save" value="${message(code: 'default.button.create.label1', default: 'Verify')}" />
</fieldset>
</g:form>
</body>
</html>