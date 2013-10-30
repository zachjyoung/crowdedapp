$(document).ready(function(){

$.getJSON( "http://smart-ip.net/geoip-json?callback=?", function(data){
var map = L.mapbox.map('map','zachyoung.map-xp4e2t1j').setView([data.latitude, data.longitude], 13);

var marker = L.marker(new L.LatLng(data.latitude, data.longitude), {
                icon: L.mapbox.marker.icon({'marker-color': 'CC0033'}),
                draggable: true
            });

map.on('dragend', function(e) {
  $('#longitude').val(e.target.latlng.lng);
  $('#latitude').val(e.target.latlng.lat);

});


marker.bindPopup('This marker is draggable! Move it around.');
marker.addTo(map);


var circle = L.circle([data.latitude, data.longitude], 500, {
    color: 'red',
    fillColor: '#f03',
    fillOpacity: 0.5
}).addTo(map);


var popup = L.popup();


map.on('click', function(e) {
  $('#longitude').val(e.latlng.lng);
  $('#latitude').val(e.latlng.lat);

});




});

});
