/**
 * Created by Herb on 9/27/2016.
 */
// TodoStore definition.
// Flux stores house application logic and state that relate to a specific domain.
// In this case, a list of todo items.
import 'whatwg-fetch';
import RiotControl from 'riotcontrol';


function FetchStore() {
    riot.observable(this) // Riot provides our event emitter.

    var self = this

    self.fetchException = null;

    /**
     * Reset tag attributes to hide the errors and cleaning the results list
     */
    self.resetData = function() {
        this.fetchException = null;
    }

    self.doRiotControlFetchRequest = function(input,init,trigger ) {
        var self = this;
        RiotControl.trigger('inprogress_start');
        fetch(input,init).then(function (response) {
            if(response.status == 204){
                return null;
            }
            return response.json();
        }).then(function (data) {
            console.log(data);
            RiotControl.trigger('inprogress_done');
            let myTrigger = JSON.parse(JSON.stringify(trigger));

            if(myTrigger.query){
                RiotControl.trigger(trigger.name,myTrigger.query,data);
            }
            else{
                self.trigger(trigger.name,data);
            }
        }).catch(function(ex) {
            console.log('fetch failed', ex)
            self.error = ex;
            RiotControl.trigger('inprogress_done');
        });
    }

    // Our store's event handlers / API.
    // This is where we would use AJAX calls to interface with the server.
    // Any number of views can emit actions/events without knowing the specifics of the back-end.
    // This store can easily be swapped for another, while the view components remain untouched.

    self.on('fetch', function(input,init,trigger) {
        console.log('fetch:',input,init,trigger);
        self.doRiotControlFetchRequest(input,init,trigger);
    })
    // The store emits change events to any listening views, so that they may react and redraw themselves.

}

if (typeof(module) !== 'undefined') module.exports = FetchStore;



