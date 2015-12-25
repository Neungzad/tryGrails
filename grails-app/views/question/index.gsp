
<%@ page import="gso.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="gsoMain">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:set var="queryParams" value="${[
			'subjectContains' : params?.subjectContains,		
			'categoryId' : params?.categoryId
		]}" />

		<div class="row">
			<div class="col-md-9">
				<h2 class="m-t-0"><g:message code="default.list.label" args="[entityName]" /></h2> 
			</div>
			<div class="col-md-3" align="right">
				<g:link class="create btn btn-primary" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link>
			</div>
		</div>	

		<div class="row">	
			<div class="col-md-9">
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>

				<g:each in="${questionInstanceList}" status="i" var="questionInstance">
					<div class="row question-summary">
						<div class="col-md-1" align="center">
							<p>${questionInstance.voteScore}</p> Votes		 
						</div>
						<div class="col-md-1" align="center">
							<p>${questionInstance.viewCount}</p> Views		 
						</div>
						<div class="col-md-10">
							<h3>
								<g:link action="show" id="${questionInstance.id}">${questionInstance.subject}</g:link>
							</h3>
							<div class="content">${questionInstance.content}</div>
							<div class="category">
								<g:link action="index" params="${[categoryId: questionInstance.category.id]}">
									<span class="label label-default">${questionInstance.category}</span>
								</g:link>
							</div>
							<div class="author">
								<g:link action="show" id="${questionInstance.id}">
									<g:formatDate format="dd MMM yyyy HH:mm น." date="${questionInstance.dateCreated}" />
								</g:link>
								<span>${questionInstance.creator.username}</span>
							</div>
						</div>
					</div>					
				</g:each>

				<g:if test="${questionInstanceCount == 0}">
					<center><h4>Not Found !</h4></center>
				</g:if>
				
				<div align="center">
					<div class="pagination">
						<g:paginate total="${questionInstanceCount ?: 0}" params="${queryParams}" />
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<label>Search</label>
				<hr style="margin: 10px 0;">				
				<g:form name="searchForm" action="index">				
					<g:textField name="subjectContains" value="${params?.subjectContains}" />
					<g:submitButton name="search_btn" value="Search" />
					
					%{-- Search by category --}%	
					<div style="margin-top: 20px;">											
						<g:each var="category" in="${categories}">
							<p>
								<g:link action="index" params="${[categoryId: category[0].id]}">						    
								    <span class="label label-default">${category[0]}</span>
								</g:link>	
								x ${category[1]} 
							</p>
						</g:each>					
					</div>
				</g:form>
				
			</div>
		</div>

	</body>
</html>
