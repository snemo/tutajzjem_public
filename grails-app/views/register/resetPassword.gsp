<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="register">
		<title>Resetowanie hasła</title>
	</head>
	<body>
	
		<g:hasErrors bean="${command}">
			<div class="alert alert-danger" role="alert">
				<ul class="errors" role="alert">
					<g:eachError bean="${command}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</div>
		</g:hasErrors>

		<form class="form-horizontal gray form-forgotpswd" role="form" action="<g:createLink controller="register" action="resetPassword"/>" method="post" autocomplete='off'>
			<g:hiddenField name='t' value='${token}'/>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-8">
					<h2>Wprowadź nowe hasło</h2>
				</div>
			</div>
			<div class="form-group">
				<label for="phone" class="col-sm-4 control-label">Nowe hasło</label>
				<div class="col-sm-8">
					<input id="password" type="password" name="password" class="form-control" placeholder="Hasło"
						required autofocus value="">
				</div>
			</div>
			<div class="form-group">
				<label for="phone" class="col-sm-4 control-label">Powtórz hasło</label>
				<div class="col-sm-8">
					<input id="password2" type="password" name="password2" class="form-control" placeholder="Powtórz hasło"
						required autofocus value="">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-8">
					<button class="btn btn-lg btn-primary btn-block" style="margin-top:10px;" type="submit">Zapisz nowe hasło</button>
				</div>
			</div>				
		</form>

		<script>
			$(document).ready(function(){
				$(".form-signin").validate();
			});
			$(document).ready(function() {
				$('#password').focus();
			});
		</script>
	</body>
</html>











