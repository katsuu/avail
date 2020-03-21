require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

/////////////// MAPBOX ///////////////
import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';

document.addEventListener('turbolinks: load', () => {
  initMapbox();
})
