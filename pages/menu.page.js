const menuController = require("../controller/menu");

module.exports = (app, db) => {
   app.get(
      "/pages/menu",
      async (_req, res) => {
         const menu = await menuController.getProducts(db);
         if(menu!=null){
            res.render("pages/menu", {
               menu
            });
         }
         else{
            console.error("menu empty, please initialize the database");
         }
      }
   );
}