

import './app.tag';
import './index.scss';

import MovieStore from '../stores/movie-store.js';
import ProgressStore from '../stores/progress-store.js';

import RiotControl from 'riotcontrol';

var movieStore = new MovieStore(); // Create a store instance.
RiotControl.addStore(movieStore)

var progressStore = new ProgressStore(); // Create a store instance.
RiotControl.addStore(progressStore)

riot.mount('app');
import '../router.js';