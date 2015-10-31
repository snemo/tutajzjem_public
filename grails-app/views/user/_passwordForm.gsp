<div class="form-group ${hasErrors(bean: user, field: 'oldPassword', 'has-error')} ">
	<label for="oldPassword" class="col-sm-2 control-label">
		Aktualne hasło
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField name="oldPassword" class="form-control" value=""/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: user, field: 'newPassword', 'has-error')} ">
	<label for="newPassword" class="col-sm-2 control-label">
		Nowe hasło
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField name="newPassword" class="form-control" value=""/>
		<span class="help-block">Hasło musi składać się z conajmniej sześciu znaków.</span>
	</div>
</div>

<div class="form-group ${hasErrors(bean: user, field: 'newPasswordRepeat', 'has-error')} ">
	<label for="newPasswordRepeat" class="col-sm-2 control-label">
		Powtórz nowe hasło
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField name="newPasswordRepeat" class="form-control" value=""/>
	</div>
</div>