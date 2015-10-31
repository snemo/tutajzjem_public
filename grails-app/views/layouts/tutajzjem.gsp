<!DOCTYPE html>
<html lang="pl-PL">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=iso-8859-2">
		<title>Tutaj Zjem</title>

		<link rel="shortcut icon" href="./resources/images/favicon.ico" />
		
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'ui/jquery-ui.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-theme.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'tutajzjem.css')}" type="text/css">
		<g:javascript src='jquery.js' />
		<g:layoutHead />
		<r:layoutResources />
	</head>
	<body>
		<div class="top-header">
			<div class="menu-container">
				<div class="centered">
					<a class="menu-logo" href="<g:createLink absolute="true"/>"></a>
					<div class=menu-search>
						<form action="<g:createLink controller="home" action="search"/>" method="get">
							<div class="input-group input-group-lg">
					          <input id="search" name="q" type="text" class="form-control" placeholder="wpisz miasto lub nazwę restauracji...">
					          <span class="input-group-btn">
						        <button type="submit" class="btn btn-search" type="button">
						        	<span class="glyphicon glyphicon-search"></span>
						        </button>
						      </span>
					        </div>
					        <input id="search-category" type="hidden" name="category" value="">
				        </form>
					</div>
				</div>
				
			</div>
		</div>
		
		<g:layoutBody />
		
		
		<!-- FOOTER -->
		<g:render template="/home/footer" />
		
		<!-- AUTOCOMPLETE -->
		<g:javascript src='ui/jquery-ui.min.js' />
		<g:render template="/home/autocomplete" />
		
		<!-- COOKIE POLICY -->
		<g:render template="/home/cookie"/>
	</body>
</html>
