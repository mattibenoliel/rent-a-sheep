import Typed from 'typed.js';
const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
  cursorChar: '🐑 ',
  strings: ["Hi", "Welcome on Rent A Sheep 🐑🐑"],
  typeSpeed: 40,
});
}
export { loadDynamicBannerText };
