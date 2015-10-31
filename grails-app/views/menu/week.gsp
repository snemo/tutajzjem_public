<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="manager">
		<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="panel panel-default">
	<div class="panel-heading">Tydzień</div>
	<div class="panel-body">
		<div class="btn-group btn-group-lg">
			<a href="<?php echo Uri::create('manager/weekmenu?id='.Input::get('id').'&week='.$minus2);?>" class="btn btn-default"><?php echo $minus2;?></a>
			<a href="<?php echo Uri::create('manager/weekmenu?id='.Input::get('id').'&week='.$minus1);?>" class="btn btn-default"><?php echo $minus1;?></a>
			<a href="<?php echo Uri::create('manager/weekmenu?id='.Input::get('id').'&week='.$current);?>" class="btn btn-primary"><?php echo $current;?></a>
			<a href="<?php echo Uri::create('manager/weekmenu?id='.Input::get('id').'&week='.$plus1);?>" class="btn btn-default"><?php echo $plus1;?></a>
			<a href="<?php echo Uri::create('manager/weekmenu?id='.Input::get('id').'&week='.$plus2);?>" class="btn btn-default"><?php echo $plus2;?></a>
		</div>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">Tygodniowe menu 01-01-2014 do 07-01.2014</div>
	<div class="panel-body">
		<div class="weekmenu-week">
			<div id="monday" class="weekmenu-day">
				<div class="weekmenu-day-header">
					<h3><span class="label label-info daylabel">Poniedziałek</span></h3>
				</div>
				<div class="weekmenu-day-items" counter="1">
					<div id="item-0" class="weekmenu-day-item" position="0">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" placeholder="np: Kotlet schabowy z ziemniakami gotowanymi">
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
					</div>
				</div>
				<div class="weekmenu-day-newitem">
					<span class="btn btn-success newitem-btn">
			        	<i class="glyphicon glyphicon-plus"></i>
			        	<span>Nowa pozycja</span>
			    	</span>
		    	</div>
		    	<hr>
			</div>
			<div id="tuesday" class="weekmenu-day">
				<div class="weekmenu-day-header">
					<h3><span class="label label-info daylabel">Wtorek</span></h3>
				</div>
				<div class="weekmenu-day-items" counter="1">
					<div id="item-0" class="weekmenu-day-item" position="0">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" placeholder="np: Kotlet schabowy z ziemniakami gotowanymi">
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
					</div>
				</div>
				<div class="weekmenu-day-newitem">
					<span class="btn btn-success newitem-btn">
			        	<i class="glyphicon glyphicon-plus"></i>
			        	<span>Nowa pozycja</span>
			    	</span>
		    	</div>
		    	<hr>
			</div>
			<div id="wednesday" class="weekmenu-day">
				<div class="weekmenu-day-header">
					<h3><span class="label label-info daylabel">Środa</span></h3>
				</div>
				<div class="weekmenu-day-items" counter="1">
					<div id="item-0" class="weekmenu-day-item" position="0">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" placeholder="np: Kotlet schabowy z ziemniakami gotowanymi">
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
					</div>
				</div>
				<div class="weekmenu-day-newitem">
					<span class="btn btn-success newitem-btn">
			        	<i class="glyphicon glyphicon-plus"></i>
			        	<span>Nowa pozycja</span>
			    	</span>
		    	</div>
		    	<hr>
			</div>
			<div id="thursday" class="weekmenu-day">
				<div class="weekmenu-day-header">
					<h3><span class="label label-info daylabel">Czwartek</span></h3>
				</div>
				<div class="weekmenu-day-items" counter="1">
					<div id="item-0" class="weekmenu-day-item" position="0">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" placeholder="np: Kotlet schabowy z ziemniakami gotowanymi">
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
					</div>
				</div>
				<div class="weekmenu-day-newitem">
					<span class="btn btn-success newitem-btn">
			        	<i class="glyphicon glyphicon-plus"></i>
			        	<span>Nowa pozycja</span>
			    	</span>
		    	</div>
		    	<hr>
			</div>
			<div id="friday" class="weekmenu-day">
				<div class="weekmenu-day-header">
					<h3><span class="label label-info daylabel">Piątek</span></h3>
				</div>
				<div class="weekmenu-day-items" counter="1">
					<div id="item-0" class="weekmenu-day-item" position="0">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" placeholder="np: Kotlet schabowy z ziemniakami gotowanymi">
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
					</div>
				</div>
				<div class="weekmenu-day-newitem">
					<span class="btn btn-success newitem-btn">
			        	<i class="glyphicon glyphicon-plus"></i>
			        	<span>Nowa pozycja</span>
			    	</span>
		    	</div>
		    	<hr>
			</div>
			<div id="saturday" class="weekmenu-day">
				<div class="weekmenu-day-header">
					<h3><span class="label label-default daylabel">Sobota</span></h3>
				</div>
				<div class="weekmenu-day-items" counter="1">
					<div id="item-0" class="weekmenu-day-item" position="0">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" placeholder="np: Kotlet schabowy z ziemniakami gotowanymi">
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
					</div>
				</div>
				<div class="weekmenu-day-newitem">
					<span class="btn btn-success newitem-btn">
			        	<i class="glyphicon glyphicon-plus"></i>
			        	<span>Nowa pozycja</span>
			    	</span>
		    	</div>
		    	<hr>
			</div>
			<div id="sunday" class="weekmenu-day">
				<div class="weekmenu-day-header">
					<h3><span class="label label-default daylabel">Niedziela</span></h3>
				</div>
				<div class="weekmenu-day-items" counter="1">
					<div id="item-0" class="weekmenu-day-item" position="0">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" placeholder="np: Kotlet schabowy z ziemniakami gotowanymi">
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
					</div>
				</div>
				<div class="weekmenu-day-newitem">
					<span class="btn btn-success newitem-btn">
			        	<i class="glyphicon glyphicon-plus"></i>
			        	<span>Nowa pozycja</span>
			    	</span>
		    	</div>
		    	<hr>
			</div>
		</div>
		<form id="menu-form" role="form" method="post" action="<?php echo Uri::current();?>">
			<input id="data" type="hidden" name="data" value="">
			<input id="week" type="hidden" name="week" value="<?php echo Input::get("week");?>">
			<input id="id" type="hidden" name="id" value="<?php echo Input::get('id');?>">
			<span id="save-btn" class="btn btn-lg btn-primary weekmenu-savebtn">
	        	<i class="glyphicon glyphicon-ok"></i>
	        	<span>Zapisz</span>
	    	</span>
		</form>
	</div>
</div>



<script id="item-template" type="text/x-handlebars-template">
					<div id="item-{{position}}" class="weekmenu-day-item" position="{{position}}">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" placeholder="np: Kotlet schabowy z ziemniakami gotowanymi">
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
					</div>
</script>



<script id="init-data" type="application/json"><?php echo isset($weekmenu)?$weekmenu:'' ?></script>

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
		var data = {days: menu}
		var source   = $("#init-template").html();
		var template = Handlebars.compile(source);

		
		$('.weekmenu-week').html(template(data));
		
	});	
	
	$(document).ready(function() {
		$(".newitem-btn").live("click", function() {

			var day = $(this).parent().parent().attr('id');
			
			var data = {position: 0}
			var source   = $("#item-template").html();
  			var template = Handlebars.compile(source);
			
  			$("#"+day+" .weekmenu-day-items").append(template(data));
		});

		$("#save-btn").click(function() {
			var data = new Array();
			$(".weekmenu-day").each(function(){
				 var weekmenu = new Object();
				 weekmenu.day = $(this).attr("id");
				 weekmenu.label=$(this).find('.daylabel').html();
				 weekmenu.items=new Array();

				 $(this).find('.weekmenu-day-item').each(function(){
					var item=new Object();
					item.name=$(this).find('.itemname').val();
					item.position=$(this).attr("position");
					item.price=$(this).find('.itemprice').val();
					weekmenu.items.push(item);
				 });

				 data.push(weekmenu);				 
			});

			$('#data').val(JSON.stringify(data));
			$('#menu-form').submit();
		});
		

		
	});	
</script>

<script id="init-template" type="text/x-handlebars-template">
{{#each days}}
			<div id="{{day}}" class="weekmenu-day">
				<div class="weekmenu-day-header">
					<h3><span class="label label-info daylabel">{{label}}</span></h3>
				</div>
				<div class="weekmenu-day-items" counter="1">
					{{#each items}}
					<div id="item-0" class="weekmenu-day-item" position="0">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" value="{{name}}" placeholder="np: Kotlet schabowy z ziemniakami gotowanymi">
								</div>
							</div>
							<div class="col-md-3 permanentmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" value="{{price}}" placeholder="Brak">
									<span class="input-group-addon">zł</span>
								</div>
							</div>
						</div>
					</div>
				    {{/each}}
				</div>
				<div class="weekmenu-day-newitem">
					<span class="btn btn-success newitem-btn">
			        	<i class="glyphicon glyphicon-plus"></i>
			        	<span>Nowa pozycja</span>
			    	</span>
		    	</div>
		    	<hr>
			</div>
{{/each}}
</script>
			
	</body>
</html>