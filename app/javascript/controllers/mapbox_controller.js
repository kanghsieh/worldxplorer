import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    markers: Array,
    apiKey: String
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/kanghsieh/cl1i9ywza004t16rzegmqr7ll"
    })

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
  };

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window);

      const customMarker = document.createElement("div");
      customMarker.className = "marker";
      // customMarker.style.backgroundImage = `url('${marker.image_url}')`;
      // customMarker.style.backgroundSize = "contain";
      // customMarker.style.width = "25px";
      // customMarker.style.height = "25px";

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    });
  };

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) => bounds.extend([ marker.lng, marker.lat ]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };
}