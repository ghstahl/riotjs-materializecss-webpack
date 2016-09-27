

import './app.tag';
import './index.scss';

import MovieStore from '../stores/movie-store.js';
import RiotControl from 'riotcontrol';

var movieStore = new MovieStore(); // Create a store instance.
RiotControl.addStore(movieStore)

riot.mount('app');
import '../router.js';