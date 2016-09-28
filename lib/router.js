/**
 * Created by Herb on 9/26/2016.
 */
import './pages/home.tag'
import './pages/projects.tag'
import './pages/details/movie-detail.tag'

import './js/ba-tiny-pubsub.js';
// we need this to easily check the current route from every component
riot.routeState = {
    view : ''
};

class Router{

    constructor(){
        this._currentView = null;
        this._views = ['home', 'projects','movie-detail'];
        this._defaultView = 'home';

        riot.route(this._handleRoute.bind(this));
        riot.route.start(true);
        riot.observable(this)
    }

    _handleRoute(view){

        // load default view, if view is not in views list
        if(this._views.indexOf(view) === -1){
            return riot.route(this._defaultView);
        }

        this._loadView(view);
        $.publish('route', [1, 2]);

//
    }

    _loadView(view){
        if (this._currentView) {
            this._currentView.unmount(true);
        }

        riot.routeState.view = view;
        this._currentView = riot.mount('#riot-subview', view)[0];
    }

}

export default new Router();