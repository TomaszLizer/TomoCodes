//
//  CusdisScript.js
//  TomoCodes
//
//  Created by Tomasz Lizer on 10/05/2025.
//

// MARK: Handle Cusdis SDK theme update
const getTheme = () => document.documentElement.getAttribute('data-bs-theme');
const setCusdidTheme = (theme) => { window.CUSDIS?.setTheme(theme); };

window.addEventListener('DOMContentLoaded', () => {
    const observer = new MutationObserver(() => { setCusdidTheme(getTheme()); });
    observer.observe(document.documentElement, { attributeFilter: ["data-bs-theme"] });
});
            
let cusdis = document.getElementById("cusdis_thread");
// Set the initial theme before loading the SDK
cusdis?.setAttribute('data-theme', getTheme());

// Load the Cusdis SDK
(function(d, s, id) {
    var js, cjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)){ return; }
    js = d.createElement(s); js.id = id;
    js.defer = true; js.async = true;
    js.onload = function(){ cusdis?.removeAttribute('hidden'); };
    js.src = "https://cusdis.com/js/cusdis.es.js";
    cjs.parentNode.insertBefore(js, cjs);
}(document, 'script', 'cusdis-sdk'));

// Dynamically adjust the Cusdis iframe height
window.addEventListener('load', function () {
    let iframe = document.querySelector("#cusdis_thread iframe");
    if (iframe) {
        function adjustIframeHeight() {
            let scrollHeight = iframe.contentWindow.document.body.scrollHeight;
            iframe.style.height = scrollHeight + "px";
        }
        adjustIframeHeight();
        let observer = new MutationObserver(adjustIframeHeight);
        observer.observe(iframe.contentWindow.document.body, { childList: true, subtree: true });
    }
});
