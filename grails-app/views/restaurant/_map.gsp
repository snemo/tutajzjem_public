<div class="restaurant-manager-map">
	<div class="map-geocode">
		<input id="input-geocode"type="text" name="geocodeaddress" class="form-control" value="" placeholder="np. Warszawa, ul. Złota 10" >
		<button id="geocode-search" type="button" class="btn btn-default">Wyszukaj</button>
	</div>
	<div id="restaurant-manager-map-canvas"></div>
</div>

<input id="input-latitude" type="hidden" name="latitude" value="${restaurantInstance?.latitude}">
<input id="input-longitude" type="hidden" name="longitude" value="${restaurantInstance?.longitude}">