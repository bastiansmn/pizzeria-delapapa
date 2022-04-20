const render = (target, endpoint) => {
   fetch(`/components/${endpoint}`)
      .then(response => response.text())
      .then(data => {
         $(target).html(data);
         const hash = endpoint.replaceAll(/\/?.*\//gm, "");
         window.location.hash = hash;
         $(`.${hash}`).addClass("active");
      });
}

class Router {
   constructor(routes, target) {
      this.routes = routes;
      this.target = target;

      $(document).ready(() => {
         if (window.location.hash) {
            const hash = window.location.hash.replace("#", "");
            render(this.target, `${hash}`);
         } else {
            render(this.target, `${this.routes[0]}`);
         }
      
         this.routes.forEach(route => {
            $(`.${route}`).on("click", () => {
               $(".nav-link").removeClass("active");
               $(`.${route}`).addClass("active");
               render(this.target, route);
            });
         });
      });
   }
}