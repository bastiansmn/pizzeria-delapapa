const render = (target, endpoint) => {
   fetch(endpoint)
      .then(response => response.text())
      .then(data => {
         console.log(data);
         $(target).html(data);
         window.location.hash = endpoint.replaceAll(/\/?.*\//gm, "");
      });
}

$(document).ready(() => {
   console.log(window.location.hash);
   if (window.location.hash) 
      render(".main__content", `/components/${window.location.hash.replace("#", "")}`);
   else 
      render(".main__content", "/components/home");
   $(".accueil").addClass("active");
   
   $(".accueil").click(() => {
      $(".nav-link").removeClass("active");
      $(".accueil").addClass("active");
      render(".main__content", "/components/home");
   });

   $(".menu").click(() => {
      $(".nav-link").removeClass("active");
      $(".menu").addClass("active");
      render(".main__content", "/components/menu");
   });

   $(".contact").click(() => {
      $(".nav-link").removeClass("active");
      $(".contact").addClass("active");
      render(".main__content", "/components/contact");
   });

});