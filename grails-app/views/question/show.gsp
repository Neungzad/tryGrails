
<%@ page import="gso.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-question" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list question">
			
				<g:if test="${questionInstance?.subject}">
				<li class="fieldcontain">
					<span id="subject-label" class="property-label"><g:message code="question.subject.label" default="Subject" /></span>
					
						<span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${questionInstance}" field="subject"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="question.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${questionInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="question.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${questionInstance?.category?.id}">${questionInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="question.comments.label" default="Comments" /></span>
					
						<g:each in="${questionInstance.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="question.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${questionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="question.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${questionInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="question.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${questionInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="question.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${questionInstance?.user?.id}">${questionInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.viewCount}">
				<li class="fieldcontain">
					<span id="viewCount-label" class="property-label"><g:message code="question.viewCount.label" default="View Count" /></span>
					
						<span class="property-value" aria-labelledby="viewCount-label"><g:fieldValue bean="${questionInstance}" field="viewCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.voteScore}">
				<li class="fieldcontain">
					<span id="voteScore-label" class="property-label"><g:message code="question.voteScore.label" default="Vote Score" /></span>
					
						<span class="property-value" aria-labelledby="voteScore-label"><g:fieldValue bean="${questionInstance}" field="voteScore"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:questionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${questionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
