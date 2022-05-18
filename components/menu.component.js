const menuController = require("../controller/menu");

module.exports = (app, db) => {
   app.put("/components/menus", async (_req, res) => {
      res.render("components/menus", {
         menus: await menuController.getMenus(db),
      });
   });
}