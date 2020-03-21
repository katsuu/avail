require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

/////////////// MAPBOX ///////////////
import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
