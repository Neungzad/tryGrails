<!DOCTYPE html>
<html>
<head>
    <title><g:layoutTitle default="Grails"/></title>
    <r:require modules="bootstrap"/>	
    <g:layoutHead/>    
    <r:layoutResources />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Stack Overflow by Grails</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">          
          <ul class="nav navbar-nav">
            <li class="active"><g:link controller="question" action="index">Question</g:link></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <sec:ifLoggedIn>           		
      				<li><a href="#">Logged in : <sec:loggedInUserInfo field="username"/></a></li>
      				<li><g:link controller="logout" action="index">Logout</g:link></li>
          	</sec:ifLoggedIn>
          	<sec:ifNotLoggedIn>
          		<li><g:link controller="login" action="index">Login</g:link></li>
          	</sec:ifNotLoggedIn>           
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
  </nav><!-- /.navbar -->

  <div class="container" id="container_body">
  	<g:layoutBody/>
  </div>	
    
  <g:javascript src="main.js" />
  <r:layoutResources />
</body>
</html>