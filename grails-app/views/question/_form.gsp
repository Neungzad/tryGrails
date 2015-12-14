<%@ page import="gso.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="question.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subject" required="" value="${questionInstance?.subject}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="question.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="content" required="" value="${questionInstance?.content}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="question.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${gso.Category.list()}" optionKey="id" required="" value="${questionInstance?.category?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="question.comments.label" default="Comments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${questionInstance?.comments?}" var="c">
    <li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comment" action="create" params="['question.id': questionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="question.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${gso.Question$QuestionStatus?.values()}" keys="${gso.Question$QuestionStatus.values()*.name()}" required="" value="${questionInstance?.status?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="question.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${gso.User.list()}" optionKey="id" required="" value="${questionInstance?.user?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'viewCount', 'error')} required">
	<label for="viewCount">
		<g:message code="question.viewCount.label" default="View Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="viewCount" type="number" value="${questionInstance.viewCount}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'voteScore', 'error')} required">
	<label for="voteScore">
		<g:message code="question.voteScore.label" default="Vote Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="voteScore" type="number" value="${questionInstance.voteScore}" required=""/>

</div>

