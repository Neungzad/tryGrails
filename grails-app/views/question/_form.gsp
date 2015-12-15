<%@ page import="gso.Question" %>

<div class="form-group fieldcontain ${hasErrors(bean: questionInstance, field: 'subject', 'error')} required">
	<label class="control-label col-sm-2" for="subject">
		<g:message code="question.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6">
		<g:textField class="form-control" name="subject" required="" value="${questionInstance?.subject}"/>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: questionInstance, field: 'content', 'error')} required">
	<label class="control-label col-sm-2" for="content">
		<g:message code="question.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6"><g:textField class="form-control" name="content" required="" value="${questionInstance?.content}"/></div>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: questionInstance, field: 'category', 'error')} required">
	<label class="control-label col-sm-2" for="category">
		<g:message code="question.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-6">
		<g:select id="category" name="category.id" from="${gso.Category.list()}" optionKey="id" required="" 
			value="${questionInstance?.category?.id}" class="many-to-one form-control" noSelection="['null':'= Select =']" />
	</div>

</div>


%{-- 
<div class="form-group fieldcontain ${hasErrors(bean: questionInstance, field: 'user', 'error')} required">
	<label class="control-label col-sm-2" for="user">
		<g:message code="question.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${gso.User.list()}" optionKey="id" required="" value="${questionInstance?.user?.id}" class="many-to-one"/>

</div> --}%


