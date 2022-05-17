const query = require("../queries/menu.query");
const { displayPrice } = require("../utils/numbers");

module.exports = (app, db) => {
   app.put("/components/starters", async (_req, res) => {
      res.render("components/starters", {
         starters: (await db.query(query.getStarters)).rows.map(e => {
            return {
               ...e,
               price: displayPrice(e.price),
            };
         }),
      });
   });
}