const query = require("../queries/menu.query");
const { displayPrice } = require("../utils/numbers");

module.exports = (app, db) => {
   app.put("/components/pizzas", async (_req, res) => {
      res.render("components/pizzas", {
         pizzas: (await db.query(query.getPizzas)).rows.map(e => {
            return {
               ...e,
               price: displayPrice(e.price),
            };
         }),
      });
   });
}