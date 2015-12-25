<%@ page import="gso.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'comment', 'error')} required">
	<label for="comment">
		<g:message code="comment.comment.label" default="Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="comment" required="" value="${commentInstance?.comment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="comment.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${gso.Question.list()}" optionKey="id" required="" value="${commentInstance?.question?.id}" class="many-to-one"/>

</div>
