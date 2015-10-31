<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="manager">
		<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="create-restaurant" class="content scaffold-create" role="main">

			<g:hasErrors bean="${restaurantInstance}">
			<div class="alert alert-danger" role="alert">
				<ul class="errors" role="alert">
					<g:eachError bean="${restaurantInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</div>
			</g:hasErrors>
			
			<div class="panel panel-default">
				<div class="panel-heading"><h4>Edytuj dane lokalu gastronomicznego</h4></div>
				<div class="panel-body">
					<form method="post" action="<g:createLink controller="restaurant" action="update" id="${restaurantInstance.id}" />" class="form-horizontal new-restaurant">
						<g:render template="form"/>
					</form>
					<br>
					<legend>Zdjęcia lokalu gastronomicznego</legend>
					<g:render template="images"/>
		
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button id="submit-restaurant" class="btn btn-lg btn-primary next-btn" type="submit">
								<i class="glyphicon glyphicon-ok"></i>
								Zapisz
							</button>
							<a href="<g:createLink controller="manager" action="index"/>" class="btn btn-lg btn-warning cancel-btn" type="submit">
								<i class="glyphicon glyphicon-remove"></i>
								Anuluj
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			$(document).ready(function() {
		
				//FORM SUBMIT
				$('#submit-restaurant').click(function() {
					$('.new-restaurant').submit();
				});
		
		// 		tinymce.init({
		// 		    selector: "textarea",
		// 		    menubar:false,
		// 		    statusbar: false,
		// 		    plugins: "textcolor,emoticons",
		// 		    language : 'pl',
		// 		    toolbar: "bold italic | alignleft aligncenter alignright alignjustify | fontsizeselect | forecolor emoticons | bullist numlist outdent indent | link image"
		// 		});
			    
			});	
		</script>
		
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaRbRjGteUJbDnzH2MIuj9sphbl7OS8qU">
    	</script>			
		<g:javascript src='manager-map.js' />
		
	</body>
</html>
