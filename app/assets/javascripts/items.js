// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function initMap(lat, lng) {

    var myCoords = new google.maps.LatLng(lat, lng);
    var url = '/item/generate_flier?store='

    var mapOptions = {
    center: myCoords,
    zoom: 14
    };

    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    var curr_loc_marker = new google.maps.Marker({
        position: myCoords,
        map: map,
        icon: {
            path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW,
            scale: 5
        }
    });

    var metro_example_marker = new google.maps.Marker({
        position: new google.maps.LatLng(43.649500, -79.372950),
        map: map,
        url: url+'Metro'
    });

    var loblaw_example_marker = new google.maps.Marker({
        position: new google.maps.LatLng(43.661820, -79.379540),
        map: map,
        url: url+'Loblaw'
    });

    var fortinos_example_marker = new google.maps.Marker({
        position: new google.maps.LatLng(43.663520, -79.367170),
        map: map,
        url: url+'Fortinos'
    });
    
    // set center for current location
    curr_loc_marker.addListener('click', function() {
        map.setCenter(curr_loc_marker.getPosition());
    });

    metro_example_marker.addListener('click', function() {
        window.location.href = metro_example_marker.url;
    });

    loblaw_example_marker.addListener('click', function() {
        window.location.href = loblaw_example_marker.url;
    });
    
    fortinos_example_marker.addListener('click', function() {
        window.location.href = fortinos_example_marker.url;
    });
}


