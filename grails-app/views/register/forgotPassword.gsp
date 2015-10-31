<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="register">
		<title>Resetowanie hasła</title>
	</head>
	<body>

		<form class="form-horizontal gray form-forgotpswd" role="form" action="<g:createLink controller="register" action="forgotPassword"/>" method="post" autocomplete='off'>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-8">
					<h2>Zapomniałeś hasła?</h2>
					<h4>Podaj adres e-mail na które zarejestrowano konto</h4>
				</div>
			</div>
			<div class="form-group">
				<label for="phone" class="col-sm-4 control-label">Adres e-mail</label>
				<div class="col-sm-8">
					<input id="username" type="text" name="username" class="form-control" placeholder="Adres e-mail"
						required autofocus value="">
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
					<button class="btn btn-lg btn-primary btn-block" style="margin-top:10px;" type="submit">Resetuj hasło</button>
				</div>
			</div>				
		</form>

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



