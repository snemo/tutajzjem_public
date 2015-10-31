<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="manager">
		<title>Zmiana hasła użytkownika</title>
	</head>
	<body>
		
		<div id="create-restaurant" class="content scaffold-create" role="main">

			<g:hasErrors bean="${user}">
			<div class="alert alert-danger" role="alert">
				<ul class="errors" role="alert">
					<g:eachError bean="${user}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</div>
			</g:hasErrors>
			
			<div class="panel panel-default">
				<div class="panel-heading"><h4>Zmiana hasła użytkownika</h4></div>
				<div class="panel-body">
				
					<g:form controller="user" action="updatePassword" id="${user?.id }" class="form-horizontal new-restaurant">
						<g:render template="passwordForm"/>
						
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button class="btn btn-lg btn-primary next-btn" type="submit">
									<i class="glyphicon glyphicon-ok"></i>
									Zapisz
								</button>
								<a href="<g:createLink controller="manager" action="index"/>" class="btn btn-lg btn-warning cancel-btn" type="submit">
									<i class="glyphicon glyphicon-remove"></i>
									Anuluj
								</a>
							</div>
						</div>
					</g:form>
					
				</div>
			</div>
			
		</div>
		
		
		
		<script type="text/javascript">
			$(document).ready(function() {
			});	
		</script>
		
	</body>
</html>
