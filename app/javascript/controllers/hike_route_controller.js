import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hike-route"
export default class extends Controller {
  static values = {
    startCoordinates: Array,
    apiKey: String
  }

  connect() {
    console.log("connected to hike route controller")
    console.log(this.apiKeyValue)
    console.log(this.startCoordinatesValue)
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/outdoors-v12',
      center: this.startCoordinatesValue,
      zoom: 12
    });

    this.draw = new MapboxDraw({
      displayControlsDefault: false,
      controls: {
        point: false,
        line_string: true,
        polygon: false,
        trash: true
      }
    });
    this.map.addControl(this.draw);
    this.sendMarkersAjaxRequest()
  }
  sendMarkersAjaxRequest() { this.map.on('draw.create', function(e) {
    const coordinates = e.features[0].geometry.coordinates;
    const data = {
      coordinates: coordinates,
    };
    console.log(data)

    const hikeId = window.location.pathname.split("/")[2];
    console.log(hikeId)

    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    console.log(csrfToken)

    fetch(`/hikes/${hikeId}/routes`, {
      method: "POST",
      headers: {
        'Content-Type': "application/json",
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => console.log(data))
  });}
}
