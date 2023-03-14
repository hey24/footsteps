import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="hike-map"
export default class extends Controller {
  static values = {
    markerCoordinates: Array,
    startCoordinates: Array,
    apiKey: String,
    markerInitialCoordinates: Object,
    markerFinishCoordinates: Object
  }

  connect() {
    // console.log(this.markerInitialCoordinatesValue)
    // console.log(this.markerCoordinatesValue.length === 0)
    // console.log(this.startCoordinatesValue)
    if (this.markerCoordinatesValue.length === 0 ) {
      this.centerPoint = this.startCoordinatesValue;
      // console.log('yooooo')
    } else {
      this.centerPoint = this.markerCoordinatesValue[0];
    }
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/outdoors-v12',
      center: this.centerPoint,
      zoom: 10.5
    });
    this.map.on('load', () => {
      // console.log("load")
      this.addRouteToMap()
      this.addMarkersToMap()
    });
  }
  addRouteToMap() {  this.map.addSource('route', {
      'type': 'geojson',
      'data': {
        'type': 'Feature',
        'properties': {},
        'geometry': {
          'type': 'LineString',
          'coordinates': this.markerCoordinatesValue
        }
      }
    });

    this.map.addLayer({
      'id': 'route',
      'type': 'line',
      'source': 'route',
      'layout': {
        'line-join': 'round',
        'line-cap': 'round'
      },
      'paint': {
        'line-color': '#F4B62D',
        'line-width': 8,
      }
    });}

    addMarkersToMap() {

        const startMarker = document.createElement("div")
        startMarker.innerHTML = this.markerInitialCoordinatesValue.marker_html
        console.log(startMarker)


        new mapboxgl.Marker(startMarker)
          .setLngLat([ this.markerInitialCoordinatesValue.lng, this.markerInitialCoordinatesValue.lat ])
          .addTo(this.map)

        const finishMarker = document.createElement("div")
        finishMarker.innerHTML = this.markerFinishCoordinatesValue.marker_html
        console.log(finishMarker)

        new mapboxgl.Marker(finishMarker)
          .setLngLat([ this.markerFinishCoordinatesValue.lng, this.markerFinishCoordinatesValue.lat ])
          .addTo(this.map)

      if (this.markerCoordinatesValue.length != 0) {
        this.fitMapToMarkers()
      }
    };

    fitMapToMarkers() {
      const bounds = new mapboxgl.LngLatBounds()
      this.markerCoordinatesValue.forEach(marker => bounds.extend([ marker[0], marker[1] ]))
      // console.log(bounds)
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 0 })

    }
}
