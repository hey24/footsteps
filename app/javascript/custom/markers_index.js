

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
    point: true,
    line_string: true,
    polygon: true,
    trash: true
  }
});
map.addControl(draw);

// // Retrieve the markers associated with the hike
// var hikeId = /* the ID of the hike */;
// $.ajax({
//   url: '/markers',
//   method: 'GET',
//   data: { hike_id: hikeId },
//   success: function(response) {
//     // Draw the route on the map
//     var coordinates = response.map(function(marker) {
//       return [marker.longitude, marker.latitude];
//     });
//     var route = {
//       type: 'Feature',
//       geometry: {
//         type: 'LineString',
//         coordinates: coordinates
//       }
//     };
//     map.addLayer({
//       id: 'route',
//       type: 'line',
//       source: {
//         type: 'geojson',
//         data: route
//       },
//       paint: {
//         'line-color': '#888',
//         'line-width': 8
//       }
//     });
//   },
//   error: function(xhr) {
//     console.log(xhr.responseText);
//   }
// });

// Capture the drawn features
map.on('draw.create', function(event) {
  var feature = event.features[0];
  saveMarker(feature);
});

map.on('draw.update', function(event) {
  var features = draw.getAll();
  saveMarkers(features);
});

map.on('draw.delete', function(event) {
  var features = draw.getAll();
  saveMarkers(features);
});

// Save a single marker
function saveMarker(feature) {
  $.ajax({
    url: '/markers',
    method: 'POST',
    data: {
      marker: {
        order: feature.properties.index,
        latitude: feature.geometry.coordinates[1],
        longitude: feature.geometry.coordinates[0]
      }
    },
    success: function(response) {
      console.log('Marker saved');
    },
    error: function(xhr) {
      console.log(xhr.responseText);
    }
  });
}

// Save multiple markers
function saveMarkers(features) {
  var markers = [];
  features.forEach(function(feature) {
    markers.push({
      index: feature.properties.index,
      latitude: feature.geometry.coordinates[1],
      longitude: feature.geometry.coordinates[0]
    });
  });
  $.ajax({
    url: '/markers/batch_create',
    method: 'POST',
    data: { markers: markers },
    success: function(response) {
      console.log('Markers saved');
    },
    error: function(xhr) {
      console.log(xhr.responseText);
    }
  });
}
