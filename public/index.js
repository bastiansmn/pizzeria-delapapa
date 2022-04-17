capitalize = (str) => {
   return str[0].toUpperCase() + str.substring(1);
}

$(document).ready(() => {
   const routes = [
      "accueil",
      "menu"
   ];
   // Instanciate main router
   new Router(routes, ".main__content");
   // Add routes to navbar
   routes.forEach(route => {
      $("#navbar")
         .append(`
            <li class="nav-item">
               <a class="nav-link ${route}">${capitalize(route)}</a>
            </li>`
         );
   });
});