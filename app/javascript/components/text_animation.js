import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Discovering patterns", "Revealing trends"],
    typeSpeed: 200,
    loop: true
  });
}

export { loadDynamicBannerText };
