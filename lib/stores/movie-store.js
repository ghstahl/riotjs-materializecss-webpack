/**
 * Created by Herb on 9/27/2016.
 */
// TodoStore definition.
// Flux stores house application logic and state that relate to a specific domain.
// In this case, a list of todo items.
import 'whatwg-fetch';

function MovieStore() {
    riot.observable(this) // Riot provides our event emitter.

    var self = this

    self.movies = []

    self.lastSearch = null;
    self.error = false;

    /**
     * Reset tag attributes to hide the errors and cleaning the results list
     */
    self.resetData = function() {
        this.movies = [];
        this.error = false;
    }

    self.doApiRequest = function(search) {
        var self = this;
        var url = 'http://www.omdbapi.com/?s=' + search;
        fetch(url).then(function (response) {
            return response.json();
        }).then(function (data) {
            console.log(data);
            localStorage.setItem("movies", JSON.stringify(data.Search));
            console.log(localStorage.getItem("movies"));
            var restoredSession = JSON.parse(localStorage.getItem('movies'));
            console.log(restoredSession);
            self.movies = restoredSession;
            self.trigger('movies_changed', self.movies)
        }).catch(function () {
            console.log("Booo");
        });

    }

    self.doDetailedRequest = function(imdbID ) {
        var self = this;
        var url = 'http://www.omdbapi.com/?i=' + imdbID
            +'&tomatoes=true'
            +'&plot=full';
        fetch(url).then(function (response) {
            return response.json();
        }).then(function (data) {
            console.log(data);
            self.trigger('movie_detail', data)
        }).catch(function () {
            console.log("Booo");
        });

    }

    // Our store's event handlers / API.
    // This is where we would use AJAX calls to interface with the server.
    // Any number of views can emit actions/events without knowing the specifics of the back-end.
    // This store can easily be swapped for another, while the view components remain untouched.

    self.on('movies_search', function(value) {
        console.log('movies_search:');
        console.log(value);
        self.doApiRequest(value.searchTerm);
    })
    self.on('movie_fetch_detail', function(value) {
        console.log('movie_fetch_detail:');
        console.log(value);
        self.doDetailedRequest(value.imdbID);
    })
    self.on('movies_clear', function() {
        self.movies.clear();
        self.trigger('movies_changed', self.movies)
    })

    self.on('movies_localstorage', function() {
        var restoredSession = JSON.parse(localStorage.getItem('movies'));
        self.movies = restoredSession;
        self.trigger('movies_changed', self.movies)
    })

    // The store emits change events to any listening views, so that they may react and redraw themselves.

}

if (typeof(module) !== 'undefined') module.exports = MovieStore;



