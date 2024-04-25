// IMPORT
// Mods Do not remove linebreaks in this file until DOMContentLoaded


// Helpers
import {ViewportFix} from "./helpers/viewportFix.js";
import {ClientInformations} from "./helpers/clientInformations.js";
import {EventHandler} from "./helpers/eventHandler.js";
import {Simplify} from "./helpers/simplify.js";
import {AddNullInteract} from "./helpers/nullInteract.js";










// INITIALIZE
const dynamicFuncs = {
    // Mods dont remove this line
    'eventHandler': new EventHandler(),
    "NullSwiper": new NullSwiper(),
};

const helperFuncs = {
    'viewportFix': new ViewportFix(),
    'clientInformations': new ClientInformations(),
    'simplify': new Simplify(),
    'nullInteract': new AddNullInteract
};

const staticFuncs = {
    // 'slug': new Classname()
};


// RUN Helperfunctions
for (let functions in helperFuncs) {
    if (typeof (helperFuncs[functions]) === "object") {
        helperFuncs[functions].init();
    }
}

// Run Static functions and dynamic functions on dom content loaded
document.addEventListener("DOMContentLoaded", () => {
    for (let functions in staticFuncs) {
        if (typeof (staticFuncs[functions]) === "object") {
            staticFuncs[functions].init();
        }
    }

    for (let functions in dynamicFuncs) {
        if (typeof (dynamicFuncs[functions]) === "object") {
            dynamicFuncs[functions].init();
        }
    }
})

// BARBA RELATED
function delay(n) {                                                                                 // DELAY HELPER FOR ASYNC FUNCTIONS WITH AWAIT
    n = n || 2000;
    return new Promise(done => {
        setTimeout(() => {
            done();
        }, n);
    });
}

barba.init({
    sync: true,
    schema: {
        prefix: 'data-routing'
    },

    transitions: [
        {
            async once(data) {

            },

            async leave(data) {
                // Set runtime to async
                const done = this.async();

                // Call your pagetransition effect here

                // Time to wait for barba page change for your animation to finish
                await delay(850);
                done();
            },

            async enter(data) {
                // Your enter stuff here
            }
        }
    ]
});


barba.hooks.enter(() => {                                                                         // RESET SCROLLPOSITION ON PAGE CHANGE
    window.scrollTo(0, 0);
});


barba.hooks.after(() => {
    // Call your page enter transition here


    // Update the dynamic functiosn
    for (let functions in dynamicFuncs) {
        if (typeof (dynamicFuncs[functions]) === "object") {
            dynamicFuncs[functions].update();
        }
    }
});
