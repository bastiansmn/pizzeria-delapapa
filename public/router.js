const render = (target, endpoint) => {
   fetch(`/components/${endpoint}`)
      .then(response => response.text())
      .then(data => {
         $(target).html(data);
         window.location.hash = endpoint.replaceAll(/\/?.*\//gm, "");
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
            $(`.${hash}`).addClass("active");
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