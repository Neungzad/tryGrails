

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="gsoMain">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-question" class="content scaffold-create" role="main">
			<h2><g:message code="default.create.label" args="[entityName]" /></h2>
			<hr>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${questionInstance}">
				<ul class="errors alert alert-danger" role="alert">
					<g:eachError bean="${questionInstance}" var="error">
					<li 
						<g:if test="${error in org.springframework.validation.FieldError}">
							data-field-id="${error.field}"
						</g:if>
						>
						<g:message error="${error}"/>
					</li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form url="[resource:questionInstance, action:'save']"  class="form-horizontal">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
