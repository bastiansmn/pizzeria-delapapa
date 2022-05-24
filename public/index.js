$(document).ready(() => {
   
   window.pageRouter = new PageRouter(
      ["accueil", "menu", "login", "register"],
      ".main__content"
   );
   window.cart = new Cart("#cart");
   window.alert = new Alert({ duration: 4000 });
   window.modal = new Modal();

   window.auth = () => {
      if (localStorage.getItem("access_token")) {
         fetch("/auth", {
            method: "GET",
            headers: {
               "Content-Type": "application/json",
               "x-access-token": localStorage.getItem("access_token")
            }
         })
            .then(res => {
               const status = res.status;
               if (status === 500) {
                  alert.show("Erreur de vérification de l'authentification automatique", AlertType.WARNING);
                  throw new Error("Erreur interne");
               }
               if (status !== 200) {
                  localStorage.removeItem("access_token");
                  throw new Error("Token invalide");
               }
               res.text().then(data => {
                  console.log(data);
                  $("#login").remove();
                  $("nav > div").append($(data));
               });
            })
            .catch(err => {
               console.error(err);
            })
      }
   }

   auth();
});