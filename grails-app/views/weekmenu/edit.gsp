<%@ page import="pl.tutajzjem.restaurant.menu.MenuUtils" %>
<%@ page import="pl.tutajzjem.restaurant.RestaurantUtils" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="manager">
		<title>Obiady dnia</title>
	</head>
	<body>

<div class="panel panel-default">
	<div class="panel-heading"><h4>Wybierz tydzień</h4></div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-6 calendar-yearweek">
				<table class="table table-hover calendar-table-yearweek">
					<thead>
						<tr>
							<th class="calendar-table-label">Miesiąc</th>
							<th class="calendar-table-label">Tydzień</th>
							<th class="calendar-table-label">P</th>
							<th class="calendar-table-label">W</th>
							<th class="calendar-table-label">Ś</th>
							<th class="calendar-table-label">C</th>
							<th class="calendar-table-label">P</th>
							<th class="calendar-table-label calendar-saturday">S</th>
							<th class="calendar-table-label calendar-sunday">N</th>
						</tr>
					</thead>
			    	<tbody>
			    		<g:each var="week" status="i" in="${weekSelector}">
				    		<tr class="calendar-table-row${i==2 ? ' success' : '' }" onclick="document.location = '<g:createLink controller="weekmenu" action="edit" id="${restaurant.identifier}" params="[yearweek: week?.yearWeek]"/>';">
				    			<td class="calendar-weekno"><g:formatDate format="MMMM" date="${week.weekDays[0]}"/></td>
				    			<td class="calendar-weekno">${week.week}</td>
					        	<g:each var="day" status="j" in="${week.weekDays}">
					        		<td class="calendar-day${MenuUtils.isCurrentDate(day) ? ' info' : '' }${j==5?' calendar-saturday':''}${j==6?' calendar-sunday':''}"><g:formatDate format="dd" date="${day}"/></td>
					        	</g:each>
				     		</tr>
				     	</g:each>
			      </tbody>
			    </table>
		    </div>
		    <div class="col-md-6">
		    	<div class="well" role="alert">Tutaj należy napisać instrukcje obsłgi<br> - text - sobota szaro, niedziela czerwono, current day - background light blue; na zielono tydzien aktualnie edytowany</div>
		    	
		    </div>
		    
		</div>
		

	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading"><h4>Obiady dnia dla tygodnia: ${weekMenu?.week } (<g:formatDate format="dd.MM.yyyy" date="${weekMenu?.weekDays[0]}"/> - <g:formatDate format="dd.MM.yyyy" date="${weekMenu?.weekDays[6]}"/>)</h4></div>
	<div class="panel-body">
		<div class="weekmenu-week">
			<div id="monday" class="weekmenu-day">
				<div class="weekmenu-day-header">
					<div class="weekmenu-day-header-block row">
						<div class="weekmenu-day-header-dayname">
							<span class="daylabel">Poniedziałek <g:formatDate format="dd.MM" date="${weekMenu?.weekDays[0] }"/></span>
							<input type="hidden" class="daydate" value="<g:formatDate format="dd.MM.yyyy" date="${weekMenu?.weekDays[0] }"/>">
						</div>
						<div class="weekmenu-day-header-openhours">
							<div class="weekmenu-day-lunchtime-label">Godziny wydawania posiłków:  </div>
							<div class="weekmenu-day-lunchtime-hourcontainer">
								<g:select name="wednesdayFromHours" from="${['01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24']}" value="${RestaurantUtils.getHourFromDate(restaurant.mondayLunchOpen)}" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-hour"/>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<g:select name="wednesdayFromMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurant.mondayLunchOpen)}" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-minute"/>
								<div class="weekmenu-day-lunchtime-dash"> - </div>
								<g:select name="wednesdayToHours" from="${['01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24']}" value="${RestaurantUtils.getHourFromDate(restaurant.mondayLunchClosed)}" class="input-sm weekmenu-day-lunchtime-select openhoursto-hour"/>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<g:select name="wednesdayToMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurant.mondayLunchClosed)}" class="input-sm weekmenu-day-lunchtime-select openhoursto-minute"/>
							</div>
						</div>
					</div>
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
							<div class="col-md-3 weekmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" placeholder="Brak">
									<span class="input-group-addon">zł</span>
									<span class="btn btn-danger input-group-addon weekmenu-item-remove">
								        <i class="glyphicon glyphicon-remove"></i>
								    </span>
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
					<div class="weekmenu-day-header-block row">
						<div class="weekmenu-day-header-dayname">
							<span class="daylabel">Wtorek <g:formatDate format="dd.MM" date="${weekMenu?.weekDays[1] }"/></span>
							<input type="hidden" class="daydate" value="<g:formatDate format="dd.MM.yyyy" date="${weekMenu?.weekDays[1] }"/>">
						</div>
						<div class="weekmenu-day-header-openhours">
							<div class="weekmenu-day-lunchtime-label">Godziny wydawania posiłków:  </div>
							<div class="weekmenu-day-lunchtime-hourcontainer">
								<g:select name="wednesdayFromHours" from="${['01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24']}" value="${RestaurantUtils.getHourFromDate(restaurant.tuesdayLunchOpen)}" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-hour"/>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<g:select name="wednesdayFromMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurant.tuesdayLunchOpen)}" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-minute"/>
								<div class="weekmenu-day-lunchtime-dash"> - </div>
								<g:select name="wednesdayToHours" from="${['01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24']}" value="${RestaurantUtils.getHourFromDate(restaurant.tuesdayLunchClosed)}" class="input-sm weekmenu-day-lunchtime-select openhoursto-hour"/>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<g:select name="wednesdayToMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurant.tuesdayLunchClosed)}" class="input-sm weekmenu-day-lunchtime-select openhoursto-minute"/>
							</div>
						</div>
					</div>
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
							<div class="col-md-3 weekmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" placeholder="Brak">
									<span class="input-group-addon">zł</span>
									<span class="btn btn-danger input-group-addon weekmenu-item-remove">
								        <i class="glyphicon glyphicon-remove"></i>
								    </span>
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
					<div class="weekmenu-day-header-block row">
						<div class="weekmenu-day-header-dayname">
							<span class="daylabel">Środa <g:formatDate format="dd.MM" date="${weekMenu?.weekDays[2] }"/></span>
							<input type="hidden" class="daydate" value="<g:formatDate format="dd.MM.yyyy" date="${weekMenu?.weekDays[2] }"/>">
						</div>
						<div class="weekmenu-day-header-openhours">
							<div class="weekmenu-day-lunchtime-label">Godziny wydawania posiłków:  </div>
							<div class="weekmenu-day-lunchtime-hourcontainer">
								<g:select name="wednesdayFromHours" from="${['01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24']}" value="${RestaurantUtils.getHourFromDate(restaurant.wednesdayLunchOpen)}" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-hour"/>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<g:select name="wednesdayFromMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurant.wednesdayLunchOpen)}" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-minute"/>
								<div class="weekmenu-day-lunchtime-dash"> - </div>
								<g:select name="wednesdayToHours" from="${['01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24']}" value="${RestaurantUtils.getHourFromDate(restaurant.wednesdayLunchClosed)}" class="input-sm weekmenu-day-lunchtime-select openhoursto-hour"/>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<g:select name="wednesdayToMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurant.wednesdayLunchClosed)}" class="input-sm weekmenu-day-lunchtime-select openhoursto-minute"/>
							</div>
						</div>
					</div>
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
							<div class="col-md-3 weekmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" placeholder="Brak">
									<span class="input-group-addon">zł</span>
									<span class="btn btn-danger input-group-addon weekmenu-item-remove">
								        <i class="glyphicon glyphicon-remove"></i>
								    </span>
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
					<div class="weekmenu-day-header-block row">
						<div class="weekmenu-day-header-dayname">
							<span class="daylabel">Czwartek <g:formatDate format="dd.MM" date="${weekMenu?.weekDays[3] }"/></span>
							<input type="hidden" class="daydate" value="<g:formatDate format="dd.MM.yyyy" date="${weekMenu?.weekDays[3] }"/>">
						</div>
						<div class="weekmenu-day-header-openhours">
							<div class="weekmenu-day-lunchtime-label">Godziny wydawania posiłków:  </div>
							<div class="weekmenu-day-lunchtime-hourcontainer">
								<g:select name="wednesdayFromHours" from="${['01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24']}" value="${RestaurantUtils.getHourFromDate(restaurant.thursdayLunchOpen)}" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-hour"/>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<g:select name="wednesdayFromMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurant.thursdayLunchOpen)}" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-minute"/>
								<div class="weekmenu-day-lunchtime-dash"> - </div>
								<g:select name="wednesdayToHours" from="${['01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24']}" value="${RestaurantUtils.getHourFromDate(restaurant.thursdayLunchClosed)}" class="input-sm weekmenu-day-lunchtime-select openhoursto-hour"/>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<g:select name="wednesdayToMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurant.thursdayLunchClosed)}" class="input-sm weekmenu-day-lunchtime-select openhoursto-minute"/>
							</div>
						</div>
					</div>
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
							<div class="col-md-3 weekmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" placeholder="Brak">
									<span class="input-group-addon">zł</span>
									<span class="btn btn-danger input-group-addon weekmenu-item-remove">
								        <i class="glyphicon glyphicon-remove"></i>
								    </span>
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
					<div class="weekmenu-day-header-block row">
						<div class="weekmenu-day-header-dayname">
							<span class="daylabel">Piątek <g:formatDate format="dd.MM" date="${weekMenu?.weekDays[4] }"/></span>
							<input type="hidden" class="daydate" value="<g:formatDate format="dd.MM.yyyy" date="${weekMenu?.weekDays[4] }"/>">
						</div>
						<div class="weekmenu-day-header-openhours">
							<div class="weekmenu-day-lunchtime-label">Godziny wydawania posiłków:  </div>
							<div class="weekmenu-day-lunchtime-hourcontainer">
								<g:select name="wednesdayFromHours" from="${['01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24']}" value="${RestaurantUtils.getHourFromDate(restaurant.fridayLunchOpen)}" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-hour"/>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<g:select name="wednesdayFromMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurant.fridayLunchOpen)}" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-minute"/>
								<div class="weekmenu-day-lunchtime-dash"> - </div>
								<g:select name="wednesdayToHours" from="${['01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24']}" value="${RestaurantUtils.getHourFromDate(restaurant.fridayLunchClosed)}" class="input-sm weekmenu-day-lunchtime-select openhoursto-hour"/>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<g:select name="wednesdayToMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurant.fridayLunchClosed)}" class="input-sm weekmenu-day-lunchtime-select openhoursto-minute"/>
							</div>
						</div>
					</div>
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
							<div class="col-md-3 weekmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" placeholder="Brak">
									<span class="input-group-addon">zł</span>
									<span class="btn btn-danger input-group-addon weekmenu-item-remove">
								        <i class="glyphicon glyphicon-remove"></i>
								    </span>
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
					<div class="weekmenu-day-header-block row">
						<div class="weekmenu-day-header-dayname">
							<span class="daylabel">Sobota <g:formatDate format="dd.MM" date="${weekMenu?.weekDays[5] }"/></span>
							<input type="hidden" class="daydate" value="<g:formatDate format="dd.MM.yyyy" date="${weekMenu?.weekDays[5] }"/>">
						</div>
						<div class="weekmenu-day-header-openhours">
							<div class="weekmenu-day-lunchtime-label">Godziny wydawania posiłków:  </div>
							<div class="weekmenu-day-lunchtime-hourcontainer">
								<g:select name="wednesdayFromHours" from="${['01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24']}" value="${RestaurantUtils.getHourFromDate(restaurant.saturdayLunchOpen)}" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-hour"/>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<g:select name="wednesdayFromMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurant.saturdayLunchOpen)}" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-minute"/>
								<div class="weekmenu-day-lunchtime-dash"> - </div>
								<g:select name="wednesdayToHours" from="${['01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24']}" value="${RestaurantUtils.getHourFromDate(restaurant.saturdayLunchClosed)}" class="input-sm weekmenu-day-lunchtime-select openhoursto-hour"/>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<g:select name="wednesdayToMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurant.saturdayLunchClosed)}" class="input-sm weekmenu-day-lunchtime-select openhoursto-minute"/>
							</div>
						</div>
					</div>
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
							<div class="col-md-3 weekmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" placeholder="Brak">
									<span class="input-group-addon">zł</span>
									<span class="btn btn-danger input-group-addon weekmenu-item-remove">
								        <i class="glyphicon glyphicon-remove"></i>
								    </span>
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
					<div class="weekmenu-day-header-block row">
						<div class="weekmenu-day-header-dayname">
							<span class="daylabel">Niedziela <g:formatDate format="dd.MM" date="${weekMenu?.weekDays[6] }"/></span>
							<input type="hidden" class="daydate" value="<g:formatDate format="dd.MM.yyyy" date="${weekMenu?.weekDays[6] }"/>">
						</div>
						<div class="weekmenu-day-header-openhours">
							<div class="weekmenu-day-lunchtime-label">Godziny wydawania posiłków:  </div>
							<div class="weekmenu-day-lunchtime-hourcontainer">
								<g:select name="wednesdayFromHours" from="${['01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24']}" value="${RestaurantUtils.getHourFromDate(restaurant.sundayLunchOpen)}" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-hour"/>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<g:select name="wednesdayFromMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurant.sundayLunchOpen)}" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-minute"/>
								<div class="weekmenu-day-lunchtime-dash"> - </div>
								<g:select name="wednesdayToHours" from="${['01','02','03','04','05','06','07','08','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24']}" value="${RestaurantUtils.getHourFromDate(restaurant.sundayLunchClosed)}" class="input-sm weekmenu-day-lunchtime-select openhoursto-hour"/>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<g:select name="wednesdayToMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurant.sundayLunchClosed)}" class="input-sm weekmenu-day-lunchtime-select openhoursto-minute"/>
							</div>
						</div>
					</div>
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
							<div class="col-md-3 weekmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" placeholder="Brak">
									<span class="input-group-addon">zł</span>
									<span class="btn btn-danger input-group-addon weekmenu-item-remove">
								        <i class="glyphicon glyphicon-remove"></i>
								    </span>
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
		<form id="menu-form" role="form" method="post" action="<g:createLink controller="weekmenu" action="save" id="${restaurant.id}"/>">
			<input id="data" type="hidden" name="data" value="">
			<input id="yearWeek" type="hidden" name="yearWeek" value="${weekMenu?.yearWeek}">
			<span id="save-btn" class="btn btn-lg btn-primary next-btn weekmenu-savebtn">
	        	<i class="glyphicon glyphicon-ok"></i>
	        	<span>Zapisz</span>
	    	</span>
	    	<a href="<g:createLink controller="manager" action="index"/>" class="btn btn-lg btn-warning cancel-btn" type="submit">
				<i class="glyphicon glyphicon-remove"></i>
				Anuluj
			</a>
	    	
		</form>
	</div>
</div>



<script id="item-template" type="text/x-handlebars-template">
					<div id="item-{{position}}" class="weekmenu-day-item" position="{{position}}">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input id="{{inputId}}" type="text" class="form-control itemname" placeholder="np: Kotlet schabowy z ziemniakami gotowanymi">
								</div>
							</div>
							<div class="col-md-3 weekmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" placeholder="Brak">
									<span class="input-group-addon">zł</span>
									<span class="btn btn-danger input-group-addon weekmenu-item-remove">
								        <i class="glyphicon glyphicon-remove"></i>
								    </span>
								</div>
							</div>
						</div>
					</div>
</script>



<script id="init-data" type="application/json">${weekMenu?.menu}</script>

<script type="text/javascript">

	//INIT WEEK MENU
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
		$("#init-data").html("null");
		
	});	

	$(document).ready(function() {
		//BIND AUTOCOMPLETE
		bindAutocomplete();
		var uniqueInputId = 1000;
		
		//ADD NEW ITEM
		$(".newitem-btn").live("click", function() {

			var day = $(this).parent().parent().attr('id');
			var inputId = "input-" + uniqueInputId++;
			
			var data = {position: 0, inputId:inputId}
			var source   = $("#item-template").html();
  			var template = Handlebars.compile(source);
			
  			$("#"+day+" .weekmenu-day-items").append(template(data));

  			//Bind autocomplete to new element
  			bindAutocomplete();
  			$('#'+inputId).focus();
		});

		//SAVE WEEK MENU
		$("#save-btn").click(function() {
			var data = new Array();
			$(".weekmenu-day").each(function(){
				 var weekmenu = new Object();
				 weekmenu.day = $(this).attr("id");
				 weekmenu.label=$(this).find('.daylabel').html();
				 weekmenu.date=$(this).find('.daydate').val();
				 weekmenu.openhoursfromhour=$(this).find('.openhoursfrom-hour').val();
				 weekmenu.openhoursfromminute=$(this).find('.openhoursfrom-minute').val();
				 weekmenu.openhourstohour=$(this).find('.openhoursto-hour').val();
				 weekmenu.openhourstominute=$(this).find('.openhoursto-minute').val();
				 weekmenu.items=new Array();

				 $(this).find('.weekmenu-day-item').each(function(){
					if($(this).find('.itemname').val() != "") {
						var item=new Object();
						item.name=$(this).find('.itemname').val();
						item.position=$(this).attr("position");
						item.price=$(this).find('.itemprice').val();
						weekmenu.items.push(item);
					}
				 });

				 data.push(weekmenu);				 
			});

			$('#data').val(JSON.stringify(data));
			$('#menu-form').submit();
		});

		$(".weekmenu-item-remove").live("click", function() {
			$(this).parent().parent().parent().parent().remove();
		});

		function bindAutocomplete() {
			var url = "<g:createLink controller="weekmenu" action="autocomplete"/>";
			$(".itemname").autocomplete({
			       source: url,
			       minLength: 2
			});
		}

		
	});	
</script>



<script id="init-template" type="text/x-handlebars-template">
{{#each days}}
			<div id="{{day}}" class="weekmenu-day">
				<div class="weekmenu-day-header">
					<div class="weekmenu-day-header-block row">
						<div class="weekmenu-day-header-dayname">
							<span class="daylabel">{{label}}</span>
							<input type="hidden" class="daydate" value="{{date}}">
						</div>
						<div class="weekmenu-day-header-openhours">
							<div class="weekmenu-day-lunchtime-label">Godziny wydawania posiłków:</div>
							<div class="weekmenu-day-lunchtime-hourcontainer">
								<select name="wednesdayFromHours" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-hour" id="wednesdayFromHours">
									{{#select openhoursfromhour}}
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									{{/select}}
								</select>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<select name="wednesdayFromMinutes" class="input-sm weekmenu-day-lunchtime-select openhoursfrom-minute" id="wednesdayFromMinutes">
									{{#select openhoursfromminute}}
									<option value="00">00</option>
									<option value="15">15</option>
									<option value="30">30</option>
									<option value="45">45</option>
									{{/select}}
								</select>
								<div class="weekmenu-day-lunchtime-dash"> - </div>
								<select name="wednesdayToHours" class="input-sm weekmenu-day-lunchtime-select openhoursto-hour" id="wednesdayToHours">
									{{#select openhourstohour}}
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									{{/select}}
								</select>
								<div class="weekmenu-day-lunchtime-colon">:</div>
								<select name="wednesdayToMinutes" class="input-sm weekmenu-day-lunchtime-select openhoursto-minute" id="wednesdayToMinutes">
									{{#select openhourstominute}}
									<option value="00">00</option>
									<option value="15">15</option>
									<option value="30">30</option>
									<option value="45">45</option>
									{{/select}}
								</select>
							</div>
						</div>
					</div>
				</div>


				<div class="weekmenu-day-items" counter="1">
					{{#if items}}
					{{#each items}}
					<div id="item-0" class="weekmenu-day-item" position="0">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" value="{{name}}" placeholder="np: Kotlet schabowy z ziemniakami gotowanymi">
								</div>
							</div>
							<div class="col-md-3 weekmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" value="{{price}}" placeholder="Brak">
									<span class="input-group-addon">zł</span>
									<span class="btn btn-danger input-group-addon weekmenu-item-remove">
								        <i class="glyphicon glyphicon-remove"></i>
								    </span>
								</div>
							</div>
						</div>
					</div>
				    {{/each}}
					{{else}}
					<div id="item-0" class="weekmenu-day-item" position="0">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group">
									<span class="input-group-addon">Pozycja:</span>
									<input type="text" class="form-control itemname" value="" placeholder="np: Kotlet schabowy z ziemniakami gotowanymi">
								</div>
							</div>
							<div class="col-md-3 weekmenu-item-price">
								<div class="input-group">
									<span class="input-group-addon">Cena:</span>
									<input type="text" class="form-control itemprice" value="" placeholder="Brak">
									<span class="input-group-addon">zł</span>
									<span class="btn btn-danger input-group-addon weekmenu-item-remove">
								        <i class="glyphicon glyphicon-remove"></i>
								    </span>
								</div>
							</div>
						</div>
					</div>
					{{/if}}
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