function initialize() {
	geocoder = new google.maps.Geocoder();
	var defaultCenter = new google.maps.LatLng(49.776913, 18.676507);
	var defaultZoom = 8;
	
	var markerLatLng = null;
	var markerLat = $('#input-latitude').val();
	var markerLng = $('#input-longitude').val();
	var markerZoom = 15;
	if(markerLat != "") {
		markerLatLng = new google.maps.LatLng(markerLat, markerLng);
		defaultCenter = markerLatLng;
		defaultZoom = markerZoom;
	} 

	
    var mapOptions = {
      center: defaultCenter,
      zoom: defaultZoom,
      scrollwheel: false 
    };
    var map = new google.maps.Map(document.getElementById("restaurant-manager-map-canvas"), mapOptions);


    var marker;
    if(markerLat != "") {
    	marker = new google.maps.Marker({
    		position: markerLatLng,
    		map: map
    	});
    }
    
    function placeMarker(location) {
   		if ( marker ) {
    		marker.setPosition(location);
    		updateLatLng(location);
    	} else {
            marker = new google.maps.Marker({
              position: location,
              map: map
            });
            updateLatLng(location);
      	}
    }
    
    function findLocalization(address, showError) {
    	geocoder.geocode( { 'address': address}, function(results, status) {
    		if (status == google.maps.GeocoderStatus.OK) {
    			map.setCenter(results[0].geometry.location);
    			placeMarker(results[0].geometry.location)
    			map.setZoom(15);
    		} else {
    			if(showError) {
    				alert("Nie znaleziono adresu. Spróbuj znaleść obiekt na mapie ręcznie.");
    			}
    		}
    	});
    }
    
    function updateLatLng(latlng) {
    	 $('#input-latitude').val(latlng.lat());
    	 $('#input-longitude').val(latlng.lng());
    }
    
    $('#geocode-search').click(function() {
    	findLocalization($('#input-geocode').val(), true)
	});
    
    google.maps.event.addListener(map, 'click', function(event) {
      placeMarker(event.latLng);
    });
    
    
    var typingTimerCity;                //timer identifier
    var typingTimerStreet;                //timer identifier
    var doneTypingInterval = 2000;  //time in ms, 5 second for example

    $('#input-city').keyup(function(){
        clearTimeout(typingTimerCity);
        typingTimerCity = setTimeout(doneTyping, doneTypingInterval);
    });
    $('#input-city').keydown(function(){
        clearTimeout(typingTimerCity);
    });
    $('#input-streetno').keyup(function(){
        clearTimeout(typingTimerStreet);
        typingTimerStreet = setTimeout(doneTyping, doneTypingInterval);
    });
    $('#input-streetno').keydown(function(){
        clearTimeout(typingTimerStreet);
    });
    
    function doneTyping () {
    	var city = $('#input-city').val();
    	var street =  $('#input-streetno').val();
    	if(street != "") {
    		street = ", ul. " + street;
    	}
    	
    	$('#input-geocode').val( city + street);
    	findLocalization($('#input-geocode').val(), false)
    }

    
}
google.maps.event.addDomListener(window, 'load', initialize);



