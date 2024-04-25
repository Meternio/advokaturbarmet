export class EventHandler {
    constructor() {
        this.triggers = document.querySelectorAll('[data-js]');
    }

    init() {
        for(let i = 0, len = this.triggers.length; i < len; i++) {
            let trigger = this.triggers[i];
            let assigned = trigger.getAttribute('data-js-assigned');

            // First check if listener is already assigned
            if(assigned === null) {
                // Get Settings
                let mode = trigger.getAttribute('data-js-mode');                // add, toggle, remove
                let listener = trigger.getAttribute('data-js-listener');
                let selector = trigger.getAttribute('data-js-selector');
                let target = trigger.getAttribute('data-js-target');

                /*  Check settings and set defaults if needed
                *   default @mode = toggle
                *   default @listener = click
                *   default @selector = .active
                *   default @target = trigger
                */

                mode = mode !== null ? mode : 'toggle';
                listener = listener !== null ? listener : 'click';
                selector = selector !== null ? selector : 'active';
                target = target !== null ? exists(document.querySelector(target)) ? document.querySelector(target) : trigger : trigger;

                // Add listener to element
                if(listener === 'click') {
                    listener = fastClick;
                }
                trigger.addEventListener(listener, () => {
                    switch(mode) {
                        case 'add':
                            target.classList.add(selector);
                            break;
                        case 'remove':
                            target.classList.remove(selector);
                            break;
                        default:
                            target.classList.toggle(selector);
                            break;
                    }
                });

                // Set attribute assigned to element to prevent multiple assignment on elements
                trigger.setAttribute('data-js-assigned', 'true');
            }
        }
    }

    update() {
        this.triggers = document.querySelectorAll('[data-js]');
        this.init();
    }
}