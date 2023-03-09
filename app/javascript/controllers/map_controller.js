import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/outdoors-v12"
    })

    this.#addMarkersToMap()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))

    const queryString = window.location.search;
    let params = new URLSearchParams(document.location.search);
    if (params.has('hike[starting_point]')) {
      let name = params.get("hike[starting_point]")
      console.log(name)
      this.#fitMapToSearch(name)
    }
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // Add this
        .addTo(this.map)
    })

    const queryString = window.location.search;
    let params = new URLSearchParams(document.location.search);
    if (!params.has('hike[starting_point]')) {
      this.#fitMapToMarkers()
    }
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    // console.log(bounds)
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    // console.log(bounds)
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 7, duration: 0 })

  }

  #fitMapToSearch(search) {
    const bounds = new mapboxgl.LngLatBounds()
    const geocodeUrl = `https://api.mapbox.com/geocoding/v5/mapbox.places/${search}.json?access_token=${this.apiKeyValue}`;
    // Use fetch to make a GET request to the Mapbox Geocoding API endpoint
    fetch(geocodeUrl)
      .then(response => response.json())
      .then(data => {
        // Get the latitude and longitude coordinates from the API response
        const latitude = data.features[0].center[1];
        const longitude = data.features[0].center[0];
        bounds.extend([longitude, latitude])
        this.map.fitBounds(bounds, { padding: 70, maxZoom: 7, duration: 0 })
        // Output the latitude and longitude coordinates
        console.log(`Latitude: ${latitude}, Longitude: ${longitude}`);
      })
      .catch(error => {
        console.error(`Error getting location: ${error}`);
      });

  }


}
