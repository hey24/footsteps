
// Replace YOUR_MAPBOX_ACCESS_TOKEN with your actual Mapbox access token
mapboxgl.accessToken = 'pk.eyJ1IjoiY2xhcG9ydCIsImEiOiJjbGV5N2EycGUwa3FvM3FwNGw0bTB1d3BuIn0.Mxbnq-7KTp7hMtPIFoPYmA';

// Initialize the map
var map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/streets-v11',
  center: [-73.95, 40.7],
  zoom: 12
});

// Initialize the Mapbox Draw plugin
var draw = new MapboxDraw({
  displayControlsDefault: false,
  controls: {
    point: false,
    line_string: true,
    polygon: false,
    trash: true
  }
});
map.addControl(draw);

map.on('draw.create', function(e) {
  var coordinates = e.features[0].geometry.coordinates;
  const data = {
    coordinates: coordinates,
  };
  console.log(data)
  // Get the hike ID from the URL params
  var hikeId = window.location.pathname.split("/")[2];
  console.log(hikeId)

  // Get the CSRF token from the page's meta tags
  const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
  console.log(csrfToken)
  fetch(`/hikes/${hikeId}/markers`, {
    method: "POST",
    headers: {
    'Content-Type': "application/json",
    'X-CSRF-Token': csrfToken // Add the authenticity token as a header
  },
    body: JSON.stringify(data)
  })
  .then(response => response.json())
  .then(data => console.log(data))

});
