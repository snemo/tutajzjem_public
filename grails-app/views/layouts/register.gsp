<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><g:layoutTitle default="Tutaj zjem" /></title>
	
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-theme.min.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.fileupload-ui.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.fileupload.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'lightbox.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'tutajzjem.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'manager.css')}" type="text/css">
	
	<g:javascript src='jquery.js' />
	<g:javascript src='lightbox-2.6.min.js' />
	<g:javascript src='jquery.ui.widget.js' />
	<g:javascript src='bootstrap.min.js' />
	<g:javascript src='jquery.fileupload.js' />
	<g:javascript src='jquery.iframe-transport.js' />
	<g:javascript src='tinymce/tinymce.min.js' />
	<g:javascript src='handlebars-v1.2.0.js' />
	
	<g:layoutHead />
	<g:javascript library="application" />
	<r:layoutResources />
</head>
<body>

	<div class="top-header">
		<div class="menu-container">
			<div class="centered">
				<a class="menu-logo" href="<g:createLink controller="home" action="index"/>"></a>
				<div class="menu-sentence"></div>
			</div>
		</div>
	</div>

	<div class="container tutajzjem-content">
		<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
		</g:if>
		<g:if test="${flash.error}">
			<div class="alert alert-danger" role="alert">${flash.error}</div>
		</g:if>

		<div id="content">
			<g:layoutBody />
		</div>
	</div>
	
	<!-- FOOTER -->
	

	<r:layoutResources />
</body>
</html>