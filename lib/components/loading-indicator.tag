import * as nprogress from 'nprogress';
import 'nprogress/nprogress.css'

<loading-indicator>
    this.on('before-mount', function() {
    console.log("before-mount");
    // before the tag is mounted
    nprogress.start();
    })

    this.on('mount', function() {
    // right after the tag is mounted on the page
    console.log("mount");
    nprogress.done();
    })

    this.on('update', function() {
    // allows recalculation of context data before the update
    })

    this.on('updated', function() {
    // right after the tag template is updated
    })

    this.on('before-unmount', function() {
    // before the tag is removed
    })

    this.on('unmount', function() {
    // when the tag is removed from the page
    })

    // curious about all events ?
    this.on('*', function(eventName) {
    console.info(eventName)
    })
</loading-indicator>