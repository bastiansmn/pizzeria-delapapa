const render = (target, endpoint, hashChange=true) => {
   fetch(`/components/${endpoint}`)
      .then(response => response.text())
      .then(data => {
         if ($(target).html() !== data) {
            $(target).html(data);
            if (hashChange) window.location.hash = endpoint;
            $(`.${endpoint}`).addClass("active");
         }
      }).catch(err => {
         console.error(err);
      });
}

class Router {
   constructor(routes, target) {
      this.routes = routes;
      this.target = target;

      this.routes.forEach(route => {
         $(`.${route}`).on("click", () => {
            Array.from($(".nav-link")).filter(el => {
               return Array.from(el.classList).some(cl => {
                  return this.routes.includes(cl);
               });
            });
            $(".nav-link").removeClass("active");
            $(`.${route}`).addClass("active");
            render(this.target, route);
         });
      });
   }
}
