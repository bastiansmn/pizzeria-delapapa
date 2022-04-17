module.exports = (app, db) => {
   app.get(
      "/components/menu",
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
         res.render("menu", {
            menu
         });
      }
   );
}