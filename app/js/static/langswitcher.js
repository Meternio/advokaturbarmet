export class LangSwitcher {
    constructor() {
        this.parent = document.querySelector('.navigation__lang');
        this.menu = document.querySelector('.header__menu');
        this.links = null;
        this.logoParent = document.querySelector('.header__bar');
        this.logolink = document.querySelector('.header__logo').parentNode;
    }

    init() {
        if(exists(this.parent)) {
            this.links = this.parent.querySelectorAll('li');

            for(let i = 0, len = this.links.length; i < len; i++) {
                this.links[i].addEventListener(fastClick, () => {

                    // Change active class on links
                    for(let x = 0, len = this.links.length; x < len; x++) {
                        this.links[x].classList.remove('active');
                    }

                    // Make Ajax call to get the menu depending on the target language
                    let langCode = this.links[i].querySelector('a').getAttribute('data-lang-id');

                    this.links[i].classList.add('active');
                    ajax('getMenu=' + langCode)
                        .then((answer) => {
                            // Animate old menu out
                            let tl = gsap.timeline({repeat: 0});
                            tl.to([this.menu], {autoAlpha: 0, duration: 0.35, ease: 'Power3.easeOut'}, "+=0.0");

                            // Insert the new Menu
                            tl.add(() => {
                                this.menu.innerHTML = answer;
                            });

                            // Animate new menu in
                            tl.to([this.menu], {autoAlpha: 1, duration: 0.35, ease: 'Power3.easeIn'}, "+=0.0");
                        });

                    // Make ajax call to get the updated logo with link
                    ajax('getHeaderLogo=' + langCode)
                        .then((answer) => {
                            this.logolink.remove();
                            this.logoParent.insertAdjacentHTML('afterbegin', answer);
                            this.logolink = document.querySelector('.header__logo').parentNode;
                        });
                });
            }
        }
    }
}