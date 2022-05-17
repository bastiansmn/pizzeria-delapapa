const query = require("../queries/menu.query");
const { displayPrice } = require("../utils/numbers");

module.exports = (app, db) => {
   app.put("/components/drinks", async (_req, res) => {
      res.render("components/drinks", {
         drinks: (await db.query(query.getDrinks)).rows.map(e => {
            return {
               ...e,
               price: displayPrice(e.price),
            };
         }),
      });
   });
}