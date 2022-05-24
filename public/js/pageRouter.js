const renderPage = (target, endpoint, hashChange=true) => {
   fetch(`/pages/${endpoint}`, {
      method: 'PUT',
      headers: {
         "x-access-token": localStorage.getItem("access_token")
      }
   })
      .then(response => response.text())
      .then(data => {
         if ($(target).html() !== data) {
            $(target).html(data);
            if (hashChange) window.location.hash = endpoint;
            $(`.nav-link.${endpoint}`).addClass("active");
            $(`.nav-link.${endpoint}`).attr("aria-current", "page");
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
            $(".nav-link").removeAttr("aria-current");
            $(`.nav-link.${route}`).attr("aria-current", "page");
            $(`.nav-link.${route}`).addClass("active");
            renderPage(this.target, route);
         });
      });
   }

   registerRoute(route) {
      this.routes.push(route);
      $(`.${route}`).on("click", () => {
         Array.from($(".nav-link")).filter(el => {
            return Array.from(el.classList).some(cl => {
               return this.routes.includes(cl);
            });
         });
         $(".nav-link").removeClass("active");
         $(".nav-link").removeAttr("aria-current");
         $(`.nav-link.${route}`).attr("aria-current", "page");
         $(`.nav-link.${route}`).addClass("active");
         renderPage(this.target, route);
      });
   }

   go(route) {
      renderPage(this.target, route);
   }
}
