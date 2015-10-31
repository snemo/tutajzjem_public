<%@ page import="pl.tutajzjem.restaurant.RestaurantUtils" %>

		<!-- MONDAY -->
		<div class="controls form-inline restaurant-openhours">
			<div class="checkbox restaurant-openhours-checkbox">
			  <label>
			    <g:checkBox name="monday" value="${restaurantInstance.monday}" />
			    Poniedziałek
			  </label>
			</div>
			<label for="monday-fromhours" class="openhours-common openhours-label">Otwarcie </label>
			<g:select name="mondayFromHours" from="${1..24}" value="${RestaurantUtils.getHourFromDate(restaurantInstance.mondayOpen)}" class="form-control input-sm openhours-common"/>
			<label for="monday-openhour-fromminutes" class="openhours-common">:</label>
			<g:select name="mondayFromMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurantInstance.mondayOpen)}" class="form-control input-sm openhours-common"/>
			<label for="openhour-to" class="openhours-common openhours-label openhours-to-label">Zamknięcie </label>
			<g:select name="mondayToHours" from="${1..24}" value="${RestaurantUtils.getHourFromDate(restaurantInstance.mondayClosed)}" class="form-control input-sm openhours-common"/>
			<label for="openhour-to-minutes" class="openhours-common">:</label>
			<g:select name="mondayToMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurantInstance.mondayClosed)}" class="form-control input-sm openhours-common"/>
		</div>
		
		<!-- TUESDAY -->
		<div class="controls form-inline restaurant-openhours">
			<div class="checkbox restaurant-openhours-checkbox">
			  <label>
			    <g:checkBox name="tuesday" value="${restaurantInstance.tuesday}" />
			    Wtorek
			  </label>
			</div>
			<label for="tuesdayFromHours" class="openhours-common openhours-label">Otwarcie </label>
			<g:select name="tuesdayFromHours" from="${1..24}" value="${RestaurantUtils.getHourFromDate(restaurantInstance.tuesdayOpen)}" class="form-control input-sm openhours-common"/>
			<label for="tuesdayFromMinutes" class="openhours-common">:</label>
			<g:select name="tuesdayFromMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurantInstance.tuesdayOpen)}" class="form-control input-sm openhours-common"/>
			<label for="openhour-to" class="openhours-common openhours-label openhours-to-label">Zamknięcie </label>
			<g:select name="tuesdayToHours" from="${1..24}" value="${RestaurantUtils.getHourFromDate(restaurantInstance.tuesdayClosed)}" class="form-control input-sm openhours-common"/>
			<label for="tuesdayToMinutes" class="openhours-common">:</label>
			<g:select name="tuesdayToMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurantInstance.tuesdayClosed)}" class="form-control input-sm openhours-common"/>
		</div>
		
		<!-- WEDNESDAY -->
		<div class="controls form-inline restaurant-openhours">
			<div class="checkbox restaurant-openhours-checkbox">
			  <label>
			    <g:checkBox name="wednesday" value="${restaurantInstance.wednesday}" />
			    Środa
			  </label>
			</div>
			<label for="wednesdayFromHours" class="openhours-common openhours-label">Otwarcie </label>
			<g:select name="wednesdayFromHours" from="${1..24}" value="${RestaurantUtils.getHourFromDate(restaurantInstance.wednesdayOpen)}" class="form-control input-sm openhours-common"/>
			<label for="wednesdayFromMinutes" class="openhours-common">:</label>
			<g:select name="wednesdayFromMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurantInstance.wednesdayOpen)}" class="form-control input-sm openhours-common"/>
			<label for="wednesdayToHours" class="openhours-common openhours-label openhours-to-label">Zamknięcie </label>
			<g:select name="wednesdayToHours" from="${1..24}" value="${RestaurantUtils.getHourFromDate(restaurantInstance.wednesdayClosed)}" class="form-control input-sm openhours-common"/>
			<label for="wednesdayToMinutes" class="openhours-common">:</label>
			<g:select name="wednesdayToMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurantInstance.wednesdayClosed)}" class="form-control input-sm openhours-common"/>
		</div>
		
		<!-- THURSDAY -->
		<div class="controls form-inline restaurant-openhours">
			<div class="checkbox restaurant-openhours-checkbox">
			  <label>
			    <g:checkBox name="thursday" value="${restaurantInstance.thursday}" />
			    Czwartek
			  </label>
			</div>
			<label for="thursdayFromHours" class="openhours-common openhours-label">Otwarcie </label>
			<g:select name="thursdayFromHours" from="${1..24}" value="${RestaurantUtils.getHourFromDate(restaurantInstance.thursdayOpen)}" class="form-control input-sm openhours-common"/>
			<label for="thursdayFromMinutes" class="openhours-common">:</label>
			<g:select name="thursdayFromMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurantInstance.thursdayOpen)}" class="form-control input-sm openhours-common"/>
			<label for="thursdayToHours" class="openhours-common openhours-label openhours-to-label">Zamknięcie </label>
			<g:select name="thursdayToHours" from="${1..24}" value="${RestaurantUtils.getHourFromDate(restaurantInstance.thursdayClosed)}" class="form-control input-sm openhours-common"/>
			<label for="thursdayToMinutes" class="openhours-common">:</label>
			<g:select name="thursdayToMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurantInstance.thursdayClosed)}" class="form-control input-sm openhours-common"/>
		</div>
		
		<!-- FRIDAY -->
		<div class="controls form-inline restaurant-openhours">
			<div class="checkbox restaurant-openhours-checkbox">
			  <label>
			    <g:checkBox name="friday" value="${restaurantInstance.friday}" />
			    Piątek
			  </label>
			</div>
			<label for="fridayFromHours" class="openhours-common openhours-label">Otwarcie </label>
			<g:select name="fridayFromHours" from="${1..24}" value="${RestaurantUtils.getHourFromDate(restaurantInstance.fridayOpen)}" class="form-control input-sm openhours-common"/>
			<label for="fridayFromMinutes" class="openhours-common">:</label>
			<g:select name="fridayFromMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurantInstance.fridayOpen)}" class="form-control input-sm openhours-common"/>
			<label for="fridayToHours" class="openhours-common openhours-label openhours-to-label">Zamknięcie </label>
			<g:select name="fridayToHours" from="${1..24}" value="${RestaurantUtils.getHourFromDate(restaurantInstance.fridayClosed)}" class="form-control input-sm openhours-common"/>
			<label for="fridayToMinutes" class="openhours-common">:</label>
			<g:select name="fridayToMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurantInstance.fridayClosed)}" class="form-control input-sm openhours-common"/>
		</div>

		<!-- SATURDAY -->
		<div class="controls form-inline restaurant-openhours">
			<div class="checkbox restaurant-openhours-checkbox">
			  <label>
			    <g:checkBox name="saturday" value="${restaurantInstance.saturday}" />
			    Sobota
			  </label>
			</div>
			<label for="saturdayFromHours" class="openhours-common openhours-label">Otwarcie </label>
			<g:select name="saturdayFromHours" from="${1..24}" value="${RestaurantUtils.getHourFromDate(restaurantInstance.saturdayOpen)}" class="form-control input-sm openhours-common"/>
			<label for="saturdayFromMinutes" class="openhours-common">:</label>
			<g:select name="saturdayFromMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurantInstance.saturdayOpen)}" class="form-control input-sm openhours-common"/>
			<label for="saturdayToHours" class="openhours-common openhours-label openhours-to-label">Zamknięcie </label>
			<g:select name="saturdayToHours" from="${1..24}" value="${RestaurantUtils.getHourFromDate(restaurantInstance.saturdayClosed)}" class="form-control input-sm openhours-common"/>
			<label for="saturdayToMinutes" class="openhours-common">:</label>
			<g:select name="saturdayToMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurantInstance.saturdayClosed)}" class="form-control input-sm openhours-common"/>
		</div>
		
		<!-- SUNDAY -->
		<div class="controls form-inline restaurant-openhours">
			<div class="checkbox restaurant-openhours-checkbox">
			  <label>
			    <g:checkBox name="sunday" value="${restaurantInstance.sunday}" />
			    Niedziela
			  </label>
			</div>
			<label for="sundayFromHours" class="openhours-common openhours-label">Otwarcie </label>
			<g:select name="sundayFromHours" from="${1..24}" value="${RestaurantUtils.getHourFromDate(restaurantInstance.sundayOpen)}" class="form-control input-sm openhours-common"/>
			<label for="sundayFromMinutes" class="openhours-common">:</label>
			<g:select name="sundayFromMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurantInstance.sundayOpen)}" class="form-control input-sm openhours-common"/>
			<label for="sundayToHours" class="openhours-common openhours-label openhours-to-label">Zamknięcie </label>
			<g:select name="sundayToHours" from="${1..24}" value="${RestaurantUtils.getHourFromDate(restaurantInstance.sundayClosed)}" class="form-control input-sm openhours-common"/>
			<label for="sundayToMinutes" class="openhours-common">:</label>
			<g:select name="sundayToMinutes" from="${['00','15','30','45']}" value="${RestaurantUtils.getMinuteFromDate(restaurantInstance.sundayClosed)}" class="form-control input-sm openhours-common"/>
		</div>