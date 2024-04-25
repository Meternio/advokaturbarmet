export class Simplify {
    constructor() {
    }

    init() {
        // Delay Function for await
        window.delay = function(n) {
            n = n || 2000;
            return new Promise(done => {
                setTimeout(() => {
                    done();
                }, n);
            });
        }

        // Check if a element exists
        window.exists = function (element) {
            return (typeof (element) != 'undefined' && element != null);
        };

        // Fast click detect touchstart support and use that instead of click
        window.fastClick = Client.isTouch ? 'touchstart' : 'click';

        // Get index of element in parent
        window.index = (node) => {
            return Array.prototype.indexOf.call(node.parentNode.childNodes, node);
        }

        // XMLHTTP Request
        /* Use as follow:
        *    ajax('parameter=value')
                 .then((answer) => {
                    console.log(answer);
             });
        * */
        window.ajax = async function (params = false, url = window.location.href) {
            if (params !== false) {
                // Start new Request
                let call = new window.XMLHttpRequest;
                call.open("POST", url, true);        // Default is same page
                call.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                call.send(params);


                return new Promise((resolve, reject) => {
                    call.onreadystatechange = function () {
                        if (call.readyState === 4 && call.status === 200) {
                            try {
                                resolve(call.responseText);
                            } catch(error) {
                                reject(error);
                            }
                        }
                    }
                });
            }
        }
    }
}