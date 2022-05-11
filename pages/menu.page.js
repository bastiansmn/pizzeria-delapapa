const menuController = require("../controller/menu");

module.exports = (app, db) => {
   app.get(
      "/pages/menu",
      async (_req, res) => {
         const products = await menuController.getProducts(db);
         const menus = await menuController.getMenus(db);

         if(menus && products){
            res.render("pages/menu", {
               menus,
               products
            });
         }
         else{
            console.error("menu empty, please initialize the database");
         }
      }
   );
}