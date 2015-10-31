<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="manager">
		<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	
<div class="panel panel-default">
	<div class="panel-heading">Stałe menu</div>
	<div class="panel-body">
		<div class="alert alert-info">Zaleca się podania kompletnego menu podzielonego na kategorie.</div>
		
		<div class="permanentmenu-groups" counter="1">
			<div id="group-0" class="permanentmenu-group" position="0">
				<div class="input-group">
					<span class="input-group-addon">Kategoria:</span>
					<input type="text" class="form-control groupname" placeholder="np. Przystawki, Zupy, Dania">
				</div>
				<div class="permanentmenu-items" counter="1">
					<div id="item-0" class="permanentmenu-item" position="0">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" placeholder="np: Rosół z makaronem">
								</div>
							</div>
							<div class="col-md-3 permanentmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" placeholder="Brak">
									<span class="input-group-addon">zł</span>
								</div>
							</div>
						</div>
						<div class="permanent-item-description-block">
							<button type="button" class="btn btn-default btn-xs item-description-btn">
							  <span class="glyphicon glyphicon-plus"></span> Dodaj opis pozycji
							</button>
							<div class="permanent-item-description">
								<div class="input-group">
									<span class="input-group-addon">Opis:</span>
									<textarea type="text" class="form-control itemdescription" placeholder="np: Składniki, waga"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="permanentmenu-newitem">
					<span id="newitem-btn" class="btn btn-success fileinput-button">
			        	<i class="glyphicon glyphicon-plus"></i>
			        	<span>Nowa pozycja</span>
			    	</span>
		    	</div>
			</div>
		</div>
		
		<div class="permanentmenu-controll">
			<hr>
			<div class="permanentmenu-newgroup">
				<span id="newgroup-btn" class="btn btn-success fileinput-button">
		        	<i class="glyphicon glyphicon-plus"></i>
		        	<span>Nowa kategoria</span>
		    	</span>
			</div>
		</div>
		<hr>
		<form id="menu-form" role="form" method="post" action="todo url">
			<input id="data" type="hidden" name="data" value="">
			<input id="id" type="hidden" name="id" value="${restaurant?.identifier}">
			<span id="save-btn" class="btn btn-lg btn-primary next permanentmenu-savebtn">Zapisz</span>
		</form>
		
		
	</div>
</div>


	

<script id="group-template" type="text/x-handlebars-template">
	<div id="group-{{position}}" class="permanentmenu-group" position="{{position}}">
		<hr>
		<div class="input-group">
					<span class="input-group-addon">Kategoria:</span>
					<input type="text" class="form-control groupname" placeholder="np. Przystawki, Zupy, Dania">
				</div>
				<div class="permanentmenu-items" counter="1">
					<div id="item-0" class="permanentmenu-item" position="0">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" placeholder="np: Rosół z makaronem">
								</div>
							</div>
							<div class="col-md-3 permanentmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" placeholder="Brak">
									<span class="input-group-addon">zł</span>
								</div>
							</div>
						</div>
						<div class="permanent-item-description-block">
							<button type="button" class="btn btn-default btn-xs item-description-btn">
							  <span class="glyphicon glyphicon-plus"></span> Dodaj opis pozycji
							</button>
							<div class="permanent-item-description">
								<div class="input-group">
									<span class="input-group-addon">Opis:</span>
									<textarea type="text" class="form-control itemdescription" placeholder="np: Składniki, waga"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="permanentmenu-newitem">
					<span id="newitem-btn" class="btn btn-success fileinput-button">
			        	<i class="glyphicon glyphicon-plus"></i>
			        	<span>Nowa pozycja</span>
			    	</span>
		    	</div>
			</div>
</script>
<script id="item-template" type="text/x-handlebars-template">
	<div id="item-{{position}}" class="permanentmenu-item" position="{{position}}">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" placeholder="np: Rosół z makaronem">
								</div>
							</div>
							<div class="col-md-3 permanentmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" placeholder="Brak">
									<span class="input-group-addon">zł</span>
								</div>
							</div>
						</div>
						<div class="permanent-item-description-block">
							<button type="button" class="btn btn-default btn-xs item-description-btn">
							  <span class="glyphicon glyphicon-plus"></span> Dodaj opis pozycji
							</button>
							<div class="permanent-item-description">
								<div class="input-group">
									<span class="input-group-addon">Opis:</span>
									<textarea type="text" class="form-control itemdescription" placeholder="np: Składniki, waga"></textarea>
								</div>
							</div>
						</div>
					</div>
</script>
<script id="init-template" type="text/x-handlebars-template">
{{#each groups}}
	<div id="group-{{position}}" class="permanentmenu-group" position="{{position}}">
		<hr>
		<div class="input-group">
					<span class="input-group-addon">Kategoria:</span>
					<input type="text" class="form-control groupname" placeholder="np. Przystawki, Zupy, Dania" value="{{name}}">
				</div>
				<div class="permanentmenu-items" counter="{{position}}">
					{{#each items}}
					<div id="item-{{position}}" class="permanentmenu-item" position="{{position}}">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" placeholder="np: Rosół z makaronem" value="{{name}}">
								</div>
							</div>
							<div class="col-md-3 permanentmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" placeholder="Brak" value="{{price}}">
									<span class="input-group-addon">zł</span>
								</div>
							</div>
						</div>
						<div class="permanent-item-description-block">
							<button type="button" class="btn btn-default btn-xs item-description-btn {{#if description}}permanent-item-description{{/if}}">
							  <span class="glyphicon glyphicon-plus"></span> Dodaj opis pozycji
							</button>
							<div class="{{#if description}}permanent-item-description-show{{else}}permanent-item-description{{/if}}">
								<div class="input-group">
									<span class="input-group-addon">Opis:</span>
									<textarea type="text" class="form-control itemdescription" placeholder="np: Składniki, waga">{{description}}</textarea>
								</div>
							</div>
						</div>
					</div>
					{{/each}}
				</div>
				<div class="permanentmenu-newitem">
					<span id="newitem-btn" class="btn btn-success fileinput-button">
			        	<i class="glyphicon glyphicon-plus"></i>
			        	<span>Nowa pozycja</span>
			    	</span>
		    	</div>
			</div>
{{/each}}
</script>

<script id="init-data" type="application/json"></script>

<script type="text/javascript">
	$(document).ready(function() {
		if($("#init-data").html()=="") {
			return;
		}
		
		var find = '&quot;';
		var re = new RegExp(find, 'g');
		var json = $("#init-data").html();
		json = json.replace(re, '"');

		
		var menu = $.parseJSON(json);
		var data = {groups: menu}
		var source   = $("#init-template").html();
		var template = Handlebars.compile(source);
		$('.permanentmenu-groups').html(template(data));
		
	});	
	
	$(document).ready(function() {
		
		$("#newgroup-btn").click(function() {
			var counter = $(".permanentmenu-groups").attr("counter");
			var data = {position: counter}
			var source   = $("#group-template").html();
  			var template = Handlebars.compile(source);
			$('.permanentmenu-groups').append(template(data));
			$(".permanentmenu-groups").attr("counter", ++counter);
		});

		$("#newitem-btn").live("click", function() {
			var groupId = $(this).parent().parent().attr("position");
			var counter = $("#group-"+groupId+" .permanentmenu-items").attr("counter");
			var data = {position: counter}
			var source   = $("#item-template").html();
  			var template = Handlebars.compile(source);
			
			$("#group-"+groupId+" .permanentmenu-items").append(template(data));
			$("#group-"+groupId+" .permanentmenu-items").attr("counter", ++counter);
		});


		$("#save-btn").click(function() {
			var data = new Array();
			
			$(".permanentmenu-group").each(function(){
				 var group = new Object();
				 group.position = $(this).attr("position");
				 group.name = $(this).find(".groupname").val();
				 group.items=new Array();

				 $(this).find('.permanentmenu-item').each(function(){
					var item=new Object();
					item.name=$(this).find('.itemname').val();
					item.position=$(this).attr("position");
					item.price=$(this).find('.itemprice').val();
					item.description=$(this).find('.itemdescription').val();
					group.items.push(item);
				 });

				 data.push(group);				 
			});

			$('#data').val(JSON.stringify(data));
			$('#menu-form').submit();
		});

		$(".item-description-btn").live("click", function() {
			$(this).parent().find('.permanent-item-description').show();
			$(this).hide();
		});
	});	
</script>
	</body>
</html>