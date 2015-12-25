
<%@ page import="gso.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="gsoMain">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-question" class="content scaffold-show" role="main">
			%{-- Question --}%
			<h2>${questionInstance?.subject}</h2>
			<hr>				
			<div class="row" >
				<div class="col-sm-10">
					<div class="row">
						<div class="col-md-1">
							<a href="#" onclick="voteScore(1, 'question', ${questionInstance?.id})">UP</a>
							<p class="m-b-0">${questionInstance?.voteScore}</p>
							<a href="#">DOWN</a>
						</div>
						<div class="col-md-11">
							${questionInstance?.content}

							%{-- Author --}%
							<div style="margin-top: 50px;">		
								<div class="row">
									<div class="col-md-8">
										<span class="label label-default">${questionInstance?.category}	</span>
										
										%{-- Edit & Del Btn --}%
										<g:if test="${currentUser == questionInstance?.creator}"> 
											<g:form url="[resource:questionInstance, action:'delete']" method="DELETE" style="margin-top: 10px;">
												<fieldset class="buttons">
													<g:link class="edit btn btn-primary btn-xs" action="edit" resource="${questionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
													<g:actionSubmit class="delete btn btn-danger btn-xs" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
												</fieldset>
											</g:form>
										</g:if>
									</div>
									<div class="col-md-4" align="left">
										<div class="user-box">
											<g:formatDate format="dd MMM yyy HH:mm น." date="${questionInstance?.dateCreated}" /><br>									
											${questionInstance?.creator?.displayName}
										</div>
									</div>
								</div>																
							</div>
						</div>						
					</div>	
					<hr>	

					%{-- comment --}%
					Loop comment				


				</div>
				<div class="col-sm-2" >
					<span style="color: #ccc;">viewed</span> ${questionInstance?.viewCount} times 
				</div>
			</div>
					
		</div>
		
		<script type="text/javascript">
			function voteScore(score, type, id){
				if ("${currentUser}" == "") {
					alert('Please Login.')
				}else{
					/*$.post('', {
						
					}, function(){

					});
*/
					alert(score+' '+type+" ${currentUser?.displayName}");
					// voter
				}				
			}	
		</script>		
	</body>
</html>
