export class ClientInformations {
    constructor() {}

    getInformation() {
        Client.windowHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
        Client.windowWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
        Client.orientationPortrait = Client.windowHeight > Client.windowWidth;
        Client.orientationLandscape = Client.windowWidth >= Client.windowHeight;
        Client.isTouch = !!('ontouchstart' in window || navigator.msMaxTouchPoints);
        Client.isTabletDevice = Client.isTouch && Client.windowWidth <= 1024 && Client.windowWidth >= 768;
        Client.isMobileDevice = Client.isTouch && Client.windowWidth < 768;
        Client.scrollPosition = document.documentElement.scrollTop;
    }

    getInformationScrollRelated() {
        Client.scrollPosition = document.documentElement.scrollTop;
    }

    init() {
        window.Client = {};
        this.getInformation();
        console.log(Client);

        window.addEventListener('resize', () => {
            this.getInformation();
        });

        window.addEventListener('scroll', () => {
            this.getInformationScrollRelated();
        });
    }
}