const query = require("../queries/menu.query");
const { displayPrice } = require("../utils/numbers");

module.exports = (app, db) => {
   app.put("/components/menus", async (_req, res) => {
      res.render("components/menus", {
         menus: (await db.query(query.getMenus)).rows.map(e => {
            return {
               ...e,
               price: displayPrice(e.price),
            };
         }),
      });
   });
}