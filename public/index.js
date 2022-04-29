$(document).ready(() => {
   
   new PageRouter(
      ["accueil", "menu"],
      ".main__content"
   );

   const cart = new Cart("#cart");

});