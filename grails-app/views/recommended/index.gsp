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
			<div class="panel-heading"><h4>Aktualne polecenia</h4></div>
			<div class="panel-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Restauracja</th>
							<th>Miasto</th>
							<th>Użytkownik/Firma</th>
							<th>Polecane od</th>
							<th>Polecane do</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${recommendedList}" status="i" var="recommended">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}" recommended="${recommended.id}">
								<td>${recommended?.restaurant?.name}</td>
								<td>${recommended?.restaurant?.city}</td>
								<td>${recommended?.restaurant?.originator?.username}/${recommended?.restaurant?.originator?.companyName}</td>
								<td><g:formatDate format="dd.MM.yyyy" date="${recommended?.validFrom}"/></td>
								<td><g:formatDate format="dd.MM.yyyy" date="${recommended?.validTo}"/></td>
								<td>
									<a class="btn btn-danger btn-sm addToRecommended" href="<g:createLink controller="recommended" action="delete" id=""/>">Usuń</a>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				
			</div>
		</div>
		
		
		
		
		<div class="panel panel-default">
			<div class="panel-heading"><h4>Dodaj nowe polecenie</h4></div>
			<div class="panel-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Restauracja</th>
							<th>Miasto</th>
							<th>Użytkownik/Firma</th>
							<th>Polecane od</th>
							<th>Polecane do</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${restaurantList}" status="i" var="restaurantInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}" restaurant="${restaurantInstance.id}">
								<td>${fieldValue(bean: restaurantInstance, field: "name")}</td>
								<td>${fieldValue(bean: restaurantInstance, field: "city")}</td>
								<td>${restaurantInstance?.originator?.username}/${restaurantInstance?.originator?.companyName}</td>
								<td>
									<input type="text" class="form-control input-sm recommendedFrom" placeholder="25.07.2014">
			  					</td>
								<td>
									<input type="text" class="form-control input-sm recommendedTo" placeholder="25.07.2014">
								</td>
								<td>
									<button class="btn btn-primary btn-sm addToRecommended">Dodaj</button>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				
			</div>
		</div>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$('.addToRecommended').live('click', function(){
					var data = new Object();
					var url = "<g:createLink controller="recommended" action="add"/>";
					data.restaurant = $(this).parent().parent().attr("restaurant");
					data.validFrom = $(this).parent().parent().find(".recommendedFrom").val();
					data.validTo = $(this).parent().parent().find(".recommendedTo").val();

					$.post( url, data, function( dataOut ) {
						  alert("Ustawiono nowe polecenie")
					});
					
				});
			});
			
		</script>
		
		
	</body>
</html>