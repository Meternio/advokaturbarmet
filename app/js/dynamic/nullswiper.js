export class NullSwiper {
    constructor() {
        this.swipers = document.querySelectorAll('.clip__swiper');
    }

    init() {
        for (let i = 0, len = this.swipers.length; i < len; i++) {
            let parent = this.swipers[i];
            let clippers = parent.querySelectorAll('.clipper');

            let swiperSettings = {
                'parent': parent,
                'slides': clippers
            };

            new ClipSwiper(swiperSettings).init();
        }
    }

    update() {
        this.swipers = document.querySelectorAll('.clip__swiper');
        this.init();
    }
}

/*
*    TODO: Fix wrong bullets after dir change
* */

class ClipSwiper {
    constructor(obj) {
        // Elements
        this.parent = obj['parent'];
        this.clippers = obj['slides'];
    }

    init() {
        // Elements
        let parent = this.parent;
        let clippers = this.clippers;
        let parentWidth = parent.getBoundingClientRect().width;
        let inner = parent.querySelector('.aspect__ratio');
        let clipBackground = parent.querySelector('.clip__background').querySelector('img');
        let bulletParent = parent.querySelector('.bullets');
        let bullets = bulletParent.querySelectorAll('.bullet');
        let counterInsert = bulletParent.querySelector('.insert');
        let counterActive = !bullets.length > 0;
        let creditsParent = parent.querySelector('.credits');
        let credits = parent.querySelectorAll('.credit');

        //GSAP
        let timelines = [];
        let addTimeline = (i) => {
            return gsap.timeline({
                defaults: {overwrite: "auto"}
            });
        };
        for (let i = 0, len = clippers.length; i < len; i++) {
            timelines[i] = addTimeline(i)
        }

        // Class related action informations
        let lazyloaded = false;

        // General Informations
        let length = parseInt(parent.getAttribute('data-slides'));
        let killedValue = 0;
        let inProgress = false;

        // Settings
        let autoplay = parent.getAttribute('data-autoplay') === 'true',
            intervalKey = parent.getAttribute('data-interval'),
            zIndex = 6;

        // Interval Settings
        let intervalTimings = {
            'slowest': 20000,
            'slow': 10000,
            'medium': 8000,
            'fast': 6000,
            'fastest': 4000
        };

        let timeout;

        // Action informations
        let actionInfo = {
            'dragging': false,
            'dirSet': false,
            'dir': 'next',
            'dirChange': false,
            'index': 0,
        };


        ///////////////////////////////
        // Declare Functions
        ///////////////////////////////
        let fnLazyloading = () => {
            lazyloaded = true;
            let lazyElements = parent.querySelectorAll('.lazy');

            if (!('IntersectionObserver' in window)) {
                for (let i = 0, len = lazyElements.length; i < len; i++) {
                    lazyElements[i].innerHTML = lazyElements[i].getAttribute('data-html');
                }
            } else {
                const config = {
                    // If the image gets within 50px in the Y axis, start the download.
                    rootMargin: '50px 0px',
                    threshold: 0.01
                };

                // The observer for the images on the page
                let observer = new IntersectionObserver(lazyload, config);
                observer.observe(parent);

                function lazyload(entries) {
                    // Loop through the entries
                    entries.forEach(entry => {
                        // Are we in viewport?
                        if (entry.intersectionRatio > 0) {

                            // Stop watching and load the image
                            observer.unobserve(entry.target);
                            let images = entry.target.querySelectorAll('.lazy');
                            if (images.length > 0) {
                                for (let i = 0, len = images.length; i < len; i++) {
                                    images[i].innerHTML = images[i].getAttribute('data-html');
                                }
                            }
                        }
                    });
                }

            }
        }
        let fnAutoplay = () => {
            if (lazyloaded) {
                actionInfo.index = fnGetAnimateIndex(actionInfo.index);
                zIndex++;
                fnRunAnimation(actionInfo.index, 0, 'next');
            }
        }
        let fnGetAnimateIndex = (activeIndex, dir = actionInfo.dir) => {
            switch (dir) {
                case 'next':
                    if ((activeIndex + 1) === length) {
                        return 0;
                    } else {
                        return activeIndex + 1;
                    }
                case 'prev':
                    if ((activeIndex - 1) < 0) {
                        return length - 1;
                    } else {
                        return activeIndex - 1;
                    }
            }
        }
        let fnRunAnimation = (index, startValue, dir) => {
            // Change Bulletpoint and Credits
            if (counterActive) {
                counterInsert.innerText = index + 1;
            } else {
                bulletParent.querySelector('.active').classList.remove('active');
                bullets[index].classList.add('active');
            }

            creditsParent.querySelector('.active').classList.remove('active');
            credits[index].classList.add('active');

            // Get Values for start animate
            let clipOpen = `inset(0% 0% 0% 0%)`;
            let clipStart = dir === 'next' ? `inset(0% 0% 0% 100%)` : `inset(0% 100% 0% 0%)`;
            clipBackground.src = clippers[index].querySelector('img').src;

            if (actionInfo.dragging) {
                if (actionInfo.dirChange && inProgress) {
                    clipOpen = dir === 'prev' ? `inset(0% 0% 0% 100%)` : `inset(0% 100% 0% 0%)`;
                    clipStart = clippers[actionInfo.index].style.clipPath;
                } else {
                    clipStart = dir === 'next' ? `inset(0% 0% 0% ${startValue}%)` : `inset(0% ${startValue}% 0% 0%)`;
                }
            }

            // Kill the running animation
            timelines[index].kill();
            // Add a new timeline to clipper
            timelines[index] = addTimeline();
            // Reset clippers state to start
            clippers[index].style.clipPath = clipStart;
            // Add zindex to element
            clippers[index].style.zIndex = zIndex;
            // Run animation
            timelines[index].fromTo([clippers[index]], {clipPath: clipStart}, {
                clipPath: clipOpen,
                duration: 0.95,
                ease: 'Expo.easeOut'
            });

            if(actionInfo.dirChange && inProgress) {
                actionInfo.dirChange = false;
                let resetDir = actionInfo.dir === 'next' ? 'prev' : 'next';
                actionInfo.index = fnGetAnimateIndex(actionInfo.index, resetDir);
            }
            console.log(actionInfo.index);
        }
        let fnSetImageWidth = () => {

            for (let i = 0, len = clippers.length; i < len; i++) {
                clippers[i].querySelector('.slide').style.width = `${parentWidth}px`;
            }

        }


        ///////////////////////////////
        // Start the magic
        ///////////////////////////////
        fnLazyloading();
        fnSetImageWidth();

        let swiperManager = new NullInteract({
            'element': inner,

            'onStart': function () {
                if (autoplay) {
                    autoplay = false;
                    clearInterval(interval);
                }
            },

            'onMove': function () {
                if (lazyloaded) {
                    if (actionInfo.dirSet) {
                        if (actionInfo.dirChange && inProgress) {
                            timelines[actionInfo.index].kill();
                            let width = 100 - (100 - killedValue - (100 / parentWidth * this.result.distanceX));
                            width = width >= 100 ? 100 : width <= 0 ? 0 : width;

                            clippers[actionInfo.index].style.clipPath = actionInfo.dir === 'prev' ?
                                `inset(0 0 0 ${width}%)` :
                                `inset(0 ${width}% 0 0)`;

                            // Apply Z-Index
                            clippers[actionInfo.index].style.zIndex = zIndex;

                        } else {
                            // Apply live dragging
                            let width = 100 - (100 / parentWidth * this.result.distanceX);
                            width = width >= 100 ? 100 : width <= 0 ? 0 : width;

                            clippers[actionInfo.index].style.clipPath = actionInfo.dir === 'next' ?
                                `inset(0 0 0 ${width}%)` :
                                `inset(0 ${width}% 0 0)`;

                            // Apply Z-Index
                            clippers[actionInfo.index].style.zIndex = zIndex;
                        }
                    } else {
                        if (this.result.distanceX >= 5) {
                            zIndex++;
                            // disable clicking flag
                            actionInfo.dragging = true;
                            // Set direction
                            actionInfo.dirSet = true;
                            // Set direction
                            let result = this.result.deltaX >= 0 ? 'prev' : 'next';
                            actionInfo.dirChange = result !== actionInfo.dir;
                            actionInfo.dir = result;
                            // Set index to animate
                            inProgress = timelines[actionInfo.index].progress() < 1;
                            if (actionInfo.dirChange && inProgress) {
                                timelines[actionInfo.index].kill();
                                killedValue = parseInt(clippers[actionInfo.index].style.clipPath.split('.')[0].replace(/[^0-9]/g, ''));
                            } else {
                                actionInfo.index = fnGetAnimateIndex(actionInfo.index);
                            }
                        }
                    }
                }
            },

            'onEnd': function () {
                // If swiper was dragged
                if (lazyloaded) {
                    if (actionInfo.dragging) {
                        if (actionInfo.dirChange && inProgress < 1) {
                            let width = 100 - killedValue - (100 / parentWidth * this.result.distanceX);
                            width = width >= 100 ? 100 : width <= 0 ? 0 : width;
                            fnRunAnimation(actionInfo.index, width, actionInfo.dir);
                            inProgress = false;
                        } else {
                            let width = 100 - (100 / parentWidth * this.result.distanceX);
                            width = width >= 100 ? 100 : width <= 0 ? 0 : width;
                            //zIndex++;
                            fnRunAnimation(actionInfo.index, width, actionInfo.dir);

                            if (timeout !== undefined) {
                                window.clearTimeout(timeout);
                            }
                            timeout = window.setTimeout(() => {
                                actionInfo.dragging = false;
                            }, 100);
                        }

                        actionInfo.dirSet = false;
                    }
                }
            }
        });

        inner.addEventListener('click', (e) => {
            if (autoplay) {
                autoplay = false;
                clearInterval(interval);
            }

            if (lazyloaded) {
                if (!actionInfo.dragging) {
                    let x = e.clientX - parent.offsetLeft;
                    actionInfo.dir = x > (parentWidth / 2) ? 'next' : 'prev';
                    actionInfo.index = fnGetAnimateIndex(actionInfo.index);
                    zIndex++;
                    fnRunAnimation(actionInfo.index, 0, actionInfo.dir);
                }
            }
        });

        // Bullet Clicks
        for (let i = 0, len = bullets.length; i < len; i++) {
            bullets[i].addEventListener('click', () => {
                if (lazyloaded) {
                    if (autoplay) {
                        autoplay = false;
                        clearInterval(interval);
                    }

                    let dir = index(bullets[i]) > actionInfo.index ? 'next' : 'prev';
                    actionInfo.index = index(bullets[i]);
                    zIndex++;
                    fnRunAnimation(actionInfo.index, 0, dir);
                }
            });
        }

        // Call autoplay if is set
        let interval = autoplay ? window.setInterval(fnAutoplay, intervalTimings[intervalKey]) : false;


        ///////////////////////////////
        // recalculate stuff on window resize
        ///////////////////////////////
        window.addEventListener('resize', () => {
            parentWidth = parent.getBoundingClientRect().width;
            fnSetImageWidth();
        });
    }
}