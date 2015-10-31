<%@ page import="pl.tutajzjem.restaurant.menu.MenuUtils" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="manager">
		<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
		<title>Panel zarządzania</title>
	</head>
	<body>
		<div class="panel panel-default">
			<div class="panel-heading"><h4>Ustawienia</h4></div>
			<div class="panel-body">
				<a href="<g:createLink controller="recommended" action="index"/>" class="btn btn-success fileinput-button attachment-btn">
		        	<span>Polecane</span>
		    	</a>
		    	<a href="link" class="btn btn-success fileinput-button attachment-btn">
		        	<i class="glyphicon glyphicon-plus"></i>
		        	<span>Zmiana hasła</span>
		    	</a>
		    	
				
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading"><h4>Lista użytkowników</h4></div>
			<div class="panel-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Firma</th>
							<th>Nazwa użytkownika</th>
							<th>Miasto</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${userList}" status="i" var="user">
							<tr class="restaurant-row ${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>${user?.companyName }</td>
								<td>${user?.username }</td>
								<td>${user?.city }</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				
			</div>
		</div>
		
		<div class="panel panel-default">
			<div class="panel-heading"><h4>Lista restauracji</h4></div>
			<div class="panel-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Restauracja</th>
							<th>Miasto</th>
							<th>Użytkownik</th>
							<th>Status</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${restaurantList}" status="i" var="restaurantInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}" restaurant="${restaurantInstance.id}">
								<td><g:link action="show" id="${restaurantInstance.id}">${fieldValue(bean: restaurantInstance, field: "name")}</g:link></td>
								<td>${fieldValue(bean: restaurantInstance, field: "city")}</td>
								<td>${fieldValue(bean: restaurantInstance, field: "originator")}</td>
								<td><g:message code="restaurant.status.${fieldValue(bean: restaurantInstance, field: "status")}" default="Brak" /></td>
								<td>
									<label>
								  	 <g:checkBox name="monday" value="${false}" />
			  						</label>
			  					</td>
								<td>
									<a class="btn btn-primary btn-xs" href="<g:createLink controller="restaurant" action="edit" id="${restaurantInstance.identifier}" />">Edytuj</a>
									<a class="btn btn-primary btn-xs" href="<g:createLink controller="permanentmenu" action="edit" id="${restaurantInstance.identifier}" />">Stałe menu</a>
									<a class="btn btn-primary btn-xs" href="<g:createLink controller="weekmenu" action="edit" id="${restaurantInstance.identifier}" params="[yearweek: MenuUtils.getCurrentYearWeek()]"/>">Tygodniowe menu</a>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				
			</div>
		</div>
		
		
		<script type="text/javascript">
			
		</script>
	</body>
</html>