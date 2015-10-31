
<%@ page import="pl.tutajzjem.restaurant.Restaurant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="manager">
		<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-restaurant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-restaurant" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list restaurant">
			
				<g:if test="${restaurantInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="restaurant.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${restaurantInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.cuisines}">
				<li class="fieldcontain">
					<span id="cuisines-label" class="property-label"><g:message code="restaurant.cuisines.label" default="Cuisines" /></span>
					
						<g:each in="${restaurantInstance.cuisines}" var="c">
						<span class="property-value" aria-labelledby="cuisines-label"><g:link controller="cuisine" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="restaurant.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${restaurantInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			
				<g:if test="${restaurantInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="restaurant.mail.label" default="Mail" /></span>
					
						<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${restaurantInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="restaurant.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${restaurantInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.originator}">
				<li class="fieldcontain">
					<span id="originator-label" class="property-label"><g:message code="restaurant.originator.label" default="Originator" /></span>
					
						<span class="property-value" aria-labelledby="originator-label"><g:link controller="secUser" action="show" id="${restaurantInstance?.originator?.id}">${restaurantInstance?.originator?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.phone1}">
				<li class="fieldcontain">
					<span id="phone1-label" class="property-label"><g:message code="restaurant.phone1.label" default="Phone1" /></span>
					
						<span class="property-value" aria-labelledby="phone1-label"><g:fieldValue bean="${restaurantInstance}" field="phone1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.phone2}">
				<li class="fieldcontain">
					<span id="phone2-label" class="property-label"><g:message code="restaurant.phone2.label" default="Phone2" /></span>
					
						<span class="property-value" aria-labelledby="phone2-label"><g:fieldValue bean="${restaurantInstance}" field="phone2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.postcode}">
				<li class="fieldcontain">
					<span id="postcode-label" class="property-label"><g:message code="restaurant.postcode.label" default="Postcode" /></span>
					
						<span class="property-value" aria-labelledby="postcode-label"><g:fieldValue bean="${restaurantInstance}" field="postcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.region}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="restaurant.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${restaurantInstance}" field="region"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="restaurant.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${restaurantInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
			
				<g:if test="${restaurantInstance?.streetno}">
				<li class="fieldcontain">
					<span id="streetno-label" class="property-label"><g:message code="restaurant.streetno.label" default="Streetno" /></span>
					
						<span class="property-value" aria-labelledby="streetno-label"><g:fieldValue bean="${restaurantInstance}" field="streetno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.types}">
				<li class="fieldcontain">
					<span id="types-label" class="property-label"><g:message code="restaurant.types.label" default="Types" /></span>
					
						<g:each in="${restaurantInstance.types}" var="t">
						<span class="property-value" aria-labelledby="types-label"><g:link controller="restaurantType" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${restaurantInstance?.webpage}">
				<li class="fieldcontain">
					<span id="webpage-label" class="property-label"><g:message code="restaurant.webpage.label" default="Webpage" /></span>
					
						<span class="property-value" aria-labelledby="webpage-label"><g:fieldValue bean="${restaurantInstance}" field="webpage"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<div id="files" class="files row attachment-files">
	    	<g:each var="image" in="${restaurantInstance?.images}">
	    		<div class="col-xs-6 col-md-3">
					<div class="thumbnail restaurantimage<?php echo $img['id']==$mainimage_id?' selected-restaurantimage':''; ?>" imageid="${image?.identifier}">
						<img alt=""${image?.name} src="<g:createLink controller="image" action="thumbnail" id="${image?.identifier}" />">
						<div class="caption">
							${image?.name}	
						</div>
					</div>
				</div>
	    	</g:each>
	    </div>
			<g:form url="[resource:restaurantInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${restaurantInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
