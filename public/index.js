$(document).ready(() => {
   
   new PageRouter(
      ["accueil", "menu","login"],
      ".main__content"
   );

   window.cart = new Cart("#cart");

   window.alert = new Alert({ duration: 4000 });
   window.modal = new Modal();
});