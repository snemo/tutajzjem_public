
<%@ page import="pl.tutajzjem.restaurant.Restaurant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-restaurant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-restaurant" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<th>Restauracja</th>
						<th>Miasto</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${restaurantInstanceList}" status="i" var="restaurantInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${restaurantInstance.id}">${fieldValue(bean: restaurantInstance, field: "name")}</g:link></td>
						<td>${fieldValue(bean: restaurantInstance, field: "city")}</td>
						<td>${fieldValue(bean: restaurantInstance, field: "latitude")}</td>
						<td>
							<a class="btn btn-primary btn-xs" href="">Edytuj</a>
							<a class="btn btn-primary btn-xs" href="">Stałe menu</a>
							<a class="btn btn-primary btn-xs" href="">Tygodniowe menu</a>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${restaurantInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
