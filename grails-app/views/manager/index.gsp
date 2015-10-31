<%@ page import="pl.tutajzjem.restaurant.menu.MenuUtils" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="manager">
		<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
		<title>Panel zarządzania</title>
	</head>
	<body>
		<%-- Already exists some restaurants --%>
		<g:if test="${restaurantInstanceList!=null && !restaurantInstanceList.isEmpty() }">
			<div class="panel panel-default">
				<div class="panel-heading"><span class="bold"><h4>Twoje obiekty gastronomiczne</h4></span></div>
				<div class="panel-body">
					<div class="manager-restaurant-list">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Restauracja</th>
									<th>Miasto</th>
									<th>Status</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${restaurantInstanceList}" status="i" var="restaurantInstance">
									<tr class="restaurant-row ${(i % 2) == 0 ? 'even' : 'odd'}" restaurant="${restaurantInstance.id}">
										<td><span class="bold">${fieldValue(bean: restaurantInstance, field: "name")}</span></td>
										<td>${fieldValue(bean: restaurantInstance, field: "city")}</td>
										<td><g:message code="restaurant.status.${fieldValue(bean: restaurantInstance, field: "status")}" default="Brak" /></td>
										<td>
											<a class="btn btn-default btn-xs" href="<g:createLink controller="restaurant" action="edit" id="${restaurantInstance.identifier}" />">Edytuj</a>
											<a class="btn btn-orange btn-xs" href="<g:createLink controller="permanentmenu" action="edit" id="${restaurantInstance.identifier}" />">Karta menu</a>
											<a class="btn btn-orange btn-xs" href="<g:createLink controller="weekmenu" action="edit" id="${restaurantInstance.identifier}" params="[yearweek: MenuUtils.getCurrentYearWeek()]"/>">Obiady dnia</a>
										</td>
									</tr>
								</g:each>
							</tbody>
						</table>
					</div>
					<a href="<g:createLink controller="restaurant" action="create" />" class="btn btn-info">
			        	<i class="glyphicon glyphicon-plus"></i>
			        	<span>Dodaj natępny lokal gastronomiczny</span>
			    	</a>
				</div>
			</div>
		</g:if>
		<%-- No restaurant - fresh account --%>
		<g:else>
			<div class="manager-norestaurants">
				<div class="manager-norestaurant-btn">
					<a href="<g:createLink controller="restaurant" action="create" />" class="btn btn-info btn-lg">
			        	<i class="glyphicon glyphicon-plus"></i>
			        	<span>Dodaj Twój lokal gastronomiczny</span>
			    	</a>
			    </div>
			</div>
		</g:else>
		
		<div class="panel panel-default">
			<div class="panel-heading"><h4>Zarządzanie kontem</h4></div>
			<div class="panel-body">
				<a href="<g:createLink controller="user" action="edit"/>" class="btn btn-orange">
		        	<i class="glyphicon glyphicon-user"></i>
		        	<span>Zmiana danych</span>
		    	</a>
		    	<a href="<g:createLink controller="user" action="changePassword"/>" class="btn btn-orange">
		        	<i class="glyphicon glyphicon-minus-sign"></i>
		        	<span>Zmiana hasła</span>
		    	</a>
		    	<g:if test="${user?.isAdmin()}">
			    	<a href="<g:createLink controller="admin" action="index"/>" class="btn btn-danger">
			        	<i class="glyphicon glyphicon-exclamation-sign"></i>
			        	<span>Panel administracyjny</span>
			    	</a>
		    	</g:if>
			</div>
		</div>
		
		<script type="text/javascript">
			$(document).ready(function() {
				//$('.restaurant-row').live('click', function(){
				//	window.location.href = '<g:createLink controller="restaurant" action="edit" />/'+$(this).attr('restaurant');
				//});
			});
			
		</script>
	</body>
</html>