module.exports = (app, db) => {
   app.get(
      "/pages/menu",
      (_req, res) => {
         const menu = [
            {
               name: "Pizza + drink",
               price: "10€",
            },
            {
               name: "Pizza + drink",
               price: "10€",
            },
            {
               name: "Pizza + drink",
               price: "10€",
            },
            {
               name: "Pizza + drink",
               price: "10€",
            },
            {
               name: "Pizza + drink",
               price: "10€",
            },
         ]
         res.render("pages/menu", {
            menu
         });
      }
   );
}