<%@ page import="pl.tutajzjem.restaurant.Restaurant" %>

<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'name', 'has-error')} ">
	<label for="name" class="col-sm-2 control-label">
		<g:message code="restaurant.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField name="name" class="form-control" value="${restaurantInstance?.name}"/>
	</div>
</div>

<g:if test="${user?.isAdmin()}">
	<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'status', 'has-error')} required">
		<label for="status" class="col-sm-2 control-label">
			<g:message code="restaurant.status.label" default="Status" />
			<span class="required-indicator">*</span>
		</label>
		<div class="col-sm-10">
			<g:select name="status" class="form-control" from="${pl.tutajzjem.restaurant.RestaurantStatus?.values()}" keys="${pl.tutajzjem.restaurant.RestaurantStatus.values()}" required="" value="${restaurantInstance?.status}" />
		</div>
	</div>
</g:if>

<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'description', 'has-error')} ">
	<label for="description" class="col-sm-2 control-label">
		<g:message code="restaurant.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textArea name="description" class="form-control" rows="5" value="${restaurantInstance?.description}"/>
	</div>
</div>

<legend>Adres lokalu gastronomicznego</legend>

<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'region', 'has-error')} required">
	<label for="status" class="col-sm-2 control-label">
		<g:message code="restaurant.region.label" default="Województwo" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:select name="region" class="form-control" from="${pl.tutajzjem.security.Region?.values()}" keys="${pl.tutajzjem.security.Region.values()*.name()}" required="" value="${restaurantInstance?.region?.toString()}" />
	</div>
</div>


<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'city', 'has-error')} ">
	<label for="city" class="col-sm-2 control-label">
		<g:message code="restaurant.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField id="input-city" name="city" class="form-control" value="${restaurantInstance?.city}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'postcode', 'has-error')} ">
	<label for="postcode" class="col-sm-2 control-label">
		<g:message code="restaurant.postcode.label" default="Postcode" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField name="postcode" class="form-control" value="${restaurantInstance?.postcode}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'streetno', 'has-error')} ">
	<label for="streetno" class="col-sm-2 control-label">
		<g:message code="restaurant.streetno.label" default="Streetno" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField id="input-streetno" name="streetno" class="form-control" value="${restaurantInstance?.streetno}"/>
	</div>
</div>

<legend>Typ lokalu oraz kuchni</legend>


<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'types', 'has-error')} ">
	<label for="types" class="col-sm-2 control-label">
		<g:message code="restaurant.types.label" default="Types" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:each in="${pl.tutajzjem.restaurant.RestaurantType.list()}" var="restaurantType">
			<label class="checkbox-inline">
				<g:checkBox name="types" value="${restaurantType.name}" checked="${restaurantType in restaurantInstance?.types}" /> ${restaurantType}
			</label>
		</g:each>
	</div>
</div>

<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'cuisines', 'has-error')} ">
	<label for="cuisines" class="col-sm-2 control-label">
		<g:message code="restaurant.cuisines.label" default="Cuisines" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:each in="${pl.tutajzjem.restaurant.Cuisine.list()}" var="cuisine">
			<label class="checkbox-inline">
				<g:checkBox name="cuisines" value="${cuisine.name}" checked="${cuisine in restaurantInstance?.cuisines}" /> ${cuisine}
			</label>
		</g:each>
	</div>
</div>

<legend>Godziny otwarcia lokalu gastronomicznego</legend>

<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'cuisines', 'has-error')} ">
	<label for="cuisines" class="col-sm-2 control-label">
		<g:message code="restaurant.openhours.label" default="Open hours" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:render template="openHours"/>
	</div>
</div>

<legend>Kontakt dla klientów lokalu gastronomicznego</legend>

<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'mail', 'has-error')} ">
	<label for="mail" class="col-sm-2 control-label">
		<g:message code="restaurant.mail.label" default="Mail" />
	</label>
	<div class="col-sm-10">
		<g:textField name="mail" class="form-control" value="${restaurantInstance?.mail}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'phone1', 'has-error')} ">
	<label for="phone1" class="col-sm-2 control-label">
		<g:message code="restaurant.phone1.label" default="Phone1" />
	</label>
	<div class="col-sm-10">
		<g:textField name="phone1" class="form-control" value="${restaurantInstance?.phone1}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'phone2', 'has-error')} ">
	<label for="phone2" class="col-sm-2 control-label">
		<g:message code="restaurant.phone2.label" default="Phone2" />
	</label>
	<div class="col-sm-10">
		<g:textField name="phone2" class="form-control" value="${restaurantInstance?.phone2}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'webpage', 'has-error')} ">
	<label for="webpage" class="col-sm-2 control-label">
		<g:message code="restaurant.webpage.label" default="Webpage" />
	</label>
	<div class="col-sm-10">
		<g:textField name="webpage" class="form-control" value="${restaurantInstance?.webpage}"/>
	</div>
</div>

<legend>Położenie lokalu na mapie</legend>

<div class="form-group ${hasErrors(bean: restaurantInstance, field: 'cuisines', 'has-error')} ">
	<label for="cuisines" class="col-sm-2 control-label">
	</label>
	<div class="col-sm-10">
		<g:render template="map"/>
	</div>
</div>

<input type="hidden" name="mainImage" value="${restaurantInstance?.mainImage?.identifier}" class="input-mainImage">

			