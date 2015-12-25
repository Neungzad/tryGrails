
<%@ page import="gso.Comment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-comment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-comment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="comment" title="${message(code: 'comment.comment.label', default: 'Comment')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'comment.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'comment.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="comment.creator.label" default="Creator" /></th>
					
						<th><g:message code="comment.updater.label" default="Updater" /></th>
					
						<g:sortableColumn property="isRightAnswer" title="${message(code: 'comment.isRightAnswer.label', default: 'Is Right Answer')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${commentInstanceList}" status="i" var="commentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${commentInstance.id}">${fieldValue(bean: commentInstance, field: "comment")}</g:link></td>
					
						<td><g:formatDate date="${commentInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${commentInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: commentInstance, field: "creator")}</td>
					
						<td>${fieldValue(bean: commentInstance, field: "updater")}</td>
					
						<td>${fieldValue(bean: commentInstance, field: "isRightAnswer")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${commentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>