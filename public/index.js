$(document).ready(() => {
   
   new PageRouter(
      ["accueil", "menu"],
      ".main__content"
   );

   window.cart = new Cart("#cart");
});