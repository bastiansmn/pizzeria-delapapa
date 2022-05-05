const menuController = require("../controller/menu");

module.exports = (app, db) => {
   app.get(
      "/pages/menu",
      async (_req, res) => {
         const menu = await menuController.getProducts(db);
         res.render("pages/menu", {
            menu
         });
      }
   );
}