const pizzaController = require("../controller/menu");
const sizesController = require("../controller/sizes");

module.exports = (app, db) => {
   app.put("/components/pizzas", async (_req, res) => {
      res.render("components/pizzas", {
         pizzas: await pizzaController.getPizzas(db),
         sizes: await sizesController.getPizzaSizes(db),
      });
   });
}