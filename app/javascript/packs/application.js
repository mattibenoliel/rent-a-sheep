import "bootstrap";
import  {loadDynamicBannerText } from  '../components/banner';

import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
loadDynamicBannerText();

