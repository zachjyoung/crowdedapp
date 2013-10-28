$(document).ready(function(){

$.getJSON( "http://smart-ip.net/geoip-json?callback=?", function(data){
var map = L.mapbox.map('map','zachyoung.map-xp4e2t1j').setView([data.latitude, data.longitude], 13);

// L.tileLayer('http://{s}.tile.cloudmade.com/API-key/997/256/{z}/{x}/{y}.png', {
//     attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
//     maxZoom: 18
// }).addTo(map);

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
