export class LangUpdate {
    constructor() {
        this.parent = document.querySelector('.navigation__lang');
        this.links = null;
    }

    init() {
        // Only call on page changes
    }

    update() {
        if(exists(this.parent)) {
            this.links = this.parent.querySelectorAll('a');

            for (let i = 0, len = this.links.length; i < len; i++) {
                let langCode = this.links[i].getAttribute('data-lang-id');

                ajax('langUpdate=' + langCode)
                    .then((answer) => {
                        this.links[i].href = answer;
                    });
            }
        }
    }
}