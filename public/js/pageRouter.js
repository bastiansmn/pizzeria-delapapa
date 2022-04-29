const renderPage = (target, endpoint, hashChange=true) => {
   fetch(`/pages/${endpoint}`)
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

class PageRouter {
   constructor(routes, target) {
      this.routes = routes;
      this.target = target;

      if (window.location.hash) {
         const hash = window.location.hash.replace("#", "");
         renderPage(this.target, `${hash}`);
      } else {
         renderPage(this.target, `${this.routes[0]}`);
      }
   
      this.routes.forEach(route => {
         $(`.${route}`).on("click", () => {
            Array.from($(".nav-link")).filter(el => {
               return Array.from(el.classList).some(cl => {
                  return this.routes.includes(cl);
               });
            });
            $(".nav-link").removeClass("active");
            $(`.${route}`).addClass("active");
            renderPage(this.target, route);
         });
      });
   }
}
