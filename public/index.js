capitalize = (str) => {
   return str[0].toUpperCase() + str.substring(1);
}

$(document).ready(async () => {
   await render("nav", "navbar", false);

   // Instanciate main router
   new Router(["accueil", "menu"], ".main__content", true);

});