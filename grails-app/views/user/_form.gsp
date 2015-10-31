
<div class="form-group ${hasErrors(bean: user, field: 'companyName', 'has-error')} ">
	<label for="name" class="col-sm-2 control-label">
		Nazwa firmy
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField name="companyName" class="form-control" value="${user?.companyName}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: user, field: 'username', 'has-error')} ">
	<label for="description" class="col-sm-2 control-label">
		Adres e-mail
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField name="username" class="form-control" value="${user?.username}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: user, field: 'phone', 'has-error')} ">
	<label for="description" class="col-sm-2 control-label">
		Telefon kontaktowy
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField name="phone" class="form-control" value="${user?.phone}"/>
	</div>
</div>

