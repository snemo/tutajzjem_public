<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="register">
		<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
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

		<form class="form-horizontal registration-form gray" role="form" method="post" action="<g:createLink controller="register" action="register" />">
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-8">
					<h2>Rejestracja</h2>
				</div>
			</div>
			<div class="form-group">
				<label for="company" class="col-sm-4 control-label">Nazwa firmy</label>
				<div class="col-sm-8">
					<input value="${command?.companyName }" type="text" name="companyName" class="form-control" id="company" placeholder="np. Moja firma S.A." required>
				</div>
			</div>
			
			<div class="form-group">
				<label for="username" class="col-sm-4 control-label">Adres e-mail</label>
				<div class="col-sm-8">
					<input value="${command?.username }" type="email" name="username" class="form-control" id="username" placeholder="Wpisz własny adres e-mail" required>
				</div>
			</div>
			<div class="form-group">
				<label for="phone" class="col-sm-4 control-label">Telefon kontaktowy</label>
				<div class="col-sm-8">
					<input value="${command?.phone }" type="text" name="phone" class="form-control" id="phone" placeholder="np. 507123456" required>
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-4 control-label">Hasło</label>
				<div class="col-sm-8">
					<input type="password" name="password" class="form-control" id="password" placeholder="Twoje silne hasło" required>
				</div>
			</div>
			<div class="form-group">
				<label for="password2" class="col-sm-4 control-label">Powtórz hasło</label>
				<div class="col-sm-8">
					<input type="password" name="password2" class="form-control" id="password2" placeholder="Powtórz hasło" required>
				</div>
			</div>
			<div class="form-group">
				<label for="captcha" class="col-sm-4 control-label">Przepisz kod</label>
				<div class="col-sm-8">
					<div class="row">
						<div class="registration-form-captcha-img">
							<img src="${createLink(controller: 'simpleCaptcha', action: 'captcha')}"/>
						</div>
						<div class="registration-form-captcha-input">
							<input type="text" name="captcha" class="form-control" id="captcha" placeholder="Przepisz kod" required>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-8">
					<div class="checkbox">
						<label>
							<input name="termsAccepted" type="checkbox" required id="acceptterms">Akceptuję <a href="<g:createLink controller="register" action="terms"/>" target="_blank">Regulamin </a>
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-8">
					<button class="btn btn-lg btn-primary btn-block" type="submit">Rejestruj</button>
				</div>
			</div>
		</form>		
		
		<script>
			$(document).ready(function(){
				$(".registration-form").validate();
			});
			$(document).ready(function() {
				$('#username').focus();
			});
		</script>
	

	</body>
</html>
