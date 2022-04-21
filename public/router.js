const render = (target, endpoint, hashChange=true) => {
   return new Promise((resolve) => {
      fetch(`/components/${endpoint}`)
         .then(response => response.text())
         .then(data => {
            if (window.location.hash !== "#" + endpoint) {
               $(target).html(data);
               if (hashChange) window.location.hash = endpoint;
               $(`.${endpoint}`).addClass("active");
            }
            resolve();
         });
   })
   // TODO Handle serveur disconnect
}

class Router {
   constructor(routes, target, main=false) {
      this.routes = routes;
      this.target = target;

      $(document).ready(async () => {
         if (main) {
            if (window.location.hash) {
               const hash = window.location.hash.replace("#", "");
               await render(this.target, `${hash}`);
            } else {
               await render(this.target, `${this.routes[0]}`);
            }
         }
      
         this.routes.forEach(route => {
            $(`.${route}`).on("click", async () => {
               $(".nav-link").removeClass("active");
               $(`.${route}`).addClass("active");
               await render(this.target, route);
            });
         });
      });
   }
}