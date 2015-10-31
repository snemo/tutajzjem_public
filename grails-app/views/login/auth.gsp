<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="register">
		<title>Logowanie</title>
	</head>
	<body>
	
		<div class="login-registration-title">
			<span class="orange bold">tutajzjem.pl</span> dla Twojego lokalu gastronomicznego
		</div>
		
		<div class="login-registration-panel">
			<div class="login-panel">
				<form class="form-signin gray" role="form" action="${postUrl}" method="post" autocomplete='off'>
					<span class="form-signin-heading">Logowanie</span>
					<input id="username" type="text" name="j_username" class="form-control" placeholder="Adres e-mail"
						required autofocus value=""> 
					<input type="password" name="j_password" class="form-control"
						placeholder="Hasło" required>
					<div class="login-signin-remember-forgot">
						<label class="form-signin-remember">
							<input name="${rememberMeParameter}" type="checkbox" checked="checked" required id="acceptterms"> Zapamiętaj mnie
						</label>
						<a class="form-signin-forgotpwd" href="<g:createLink controller="register" action="forgotPassword" />">zapomniałem hasła</a>
					</div>
					
					<button class="btn btn-lg btn-orange btn-block" style="margin-top:10px;" type="submit">Zaloguj się</button>
				</form>
			</div>
			<div class="verticalline"></div>
			<div class="registration-panel">
				<div class="registration-panel-msg gray">
					<p>Nie masz konta?</p>
					<p class="msg-register">Zarejestruj się!</p>
					<p>Rejestracja jest całkowicie <span class="bold">darmowa!</span></p>
					<p class="msg-rules">Przed rejestracją nie zapomnij zapoznać się<br/> z regulaminem korzystania z serwisu <span class="orange">tutajzjem.pl</span></p>
				</div>
				<a href="<g:createLink controller="register" action="index" />" class="btn btn-lg btn-info btn-block" style="margin-top:10px;">Zarajestruj się</a>
			</div>
		</div>













		<script>
			$(document).ready(function(){
				$(".form-signin").validate();
			});
			$(document).ready(function() {
				$('#username').focus();
			});
		</script>
	

	</body>
</html>
