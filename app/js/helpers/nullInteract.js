export class AddNullInteract {
    constructor() {

        this.NullInteract = class NullInteract {
            constructor(obj) {
                this.element = obj['element'];
                this.isTouch = Client.isTouch;

                this.actions = {
                    'pressed': false,
                }

                this.handlers = {
                    'onStart': this.isTouch ? 'touchstart' : 'mousedown',
                    'onMove': this.isTouch ? 'touchmove' : 'mousemove',
                    'onEnd': this.isTouch ? 'touchend' : 'mouseup'
                }

                this.result = {
                    'distanceX': 0,
                    'distanceY': 0,
                    'startX': 0,
                    'startY': 0,
                    'deltaX': 0,
                    'deltaY': 0
                }

                this.callbacks = {
                    'onStart': obj['onStart'],
                    'onMove': obj['onMove'],
                    'onEnd': obj['onEnd'],
                }

                this.init();
            }

            onStart(e) {
                this.actions.pressed = true;
                this.result.startX = this.isTouch ? e.touches[0].screenX : e.screenX;
                this.result.startY = this.isTouch ? e.touches[0].screenY : e.screenY;

                if (this.callbacks.onStart !== undefined) {
                    this.callbacks.onStart.bind(this)();
                }
            }

            onMove(e) {
                if (this.actions.pressed) {
                    this.result.deltaX = this.isTouch ? (this.result.startX - e.touches[0].screenX) * -1 : (this.result.startX - e.screenX) * -1;
                    this.result.deltaY = this.isTouch ? (this.result.startY - e.touches[0].screenY) * -1 : (this.result.startY - e.screenY) * -1;
                    this.result.distanceX = Math.abs(this.result.deltaX);
                    this.result.distanceY = Math.abs(this.result.deltaY);

                    if (this.callbacks.onMove !== undefined) {
                        this.callbacks.onMove.bind(this)();
                    }
                }
            }

            onEnd(e) {
                if (this.callbacks.onEnd !== undefined) {
                    this.callbacks.onEnd.bind(this)();
                }

                this.actions.pressed = false;

                this.result = {
                    'distanceX': 0,
                    'distanceY': 0,
                    'startX': 0,
                    'startY': 0,
                    'deltaX': 0,
                    'deltaY': 0
                }
            }

            init() {
                this.element.addEventListener(this.handlers.onStart, (e) => {
                    this.onStart(e);
                });
                document.body.addEventListener(this.handlers.onEnd, (e) => {
                    this.onEnd(e);
                });
                document.body.addEventListener(this.handlers.onMove, (e) => {
                    this.onMove(e)
                });
            }
        }
    }

    init() {
        window.NullInteract = this.NullInteract;
    }
}
