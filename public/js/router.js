const render = (target, endpoint, hashChange=false) => {
   fetch(`/components/${endpoint}`, {
      method: "PUT"
   })
      .then(response => response.text())
      .then(data => {
         if ($(target).html() !== data) {
            $(target).html(data);
            if (hashChange) window.location.hash = endpoint;
            $(`.${endpoint}`).addClass("active");
         }
      }).catch(err => {
         console.error(err);
         $(target).html(`<div class="alert alert-danger">${err}</div>`);
      });
}

class Router {
   constructor(routes, target, defaultRoute="") {
      this.routes = routes;
      this.target = target;
      this.defaultRoute = defaultRoute;

      this.routes.forEach(route => {
         $(`.${route}`).on("click", () => {
            this.routes.forEach(r => {
               $(`.${r}`).removeClass("active");
            })
            $(`.${route}`).addClass("active");
            render(this.target, route);
         });
      });
      if (defaultRoute) 
         render(this.target, this.routes.find(e => e === defaultRoute));
   }
}
