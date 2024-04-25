'use strict';

export class ViewportFix {
    constructor() {
        this.vh = window.innerHeight * 0.01;
    }

    init() {
        document.documentElement.style.setProperty('--vh', `${this.vh}px`);
        document.documentElement.style.setProperty('--vhBar', `${this.vh}px`);

        window.addEventListener('resize', () => {
            this.vh = window.innerHeight * 0.01;
            document.documentElement.style.setProperty('--vh', `${this.vh}px`);
        });
    }
}