const drinksController = require("../controller/menu");
const sizesController = require("../controller/sizes");

module.exports = (app, db) => {
   app.put("/components/drinks", async (_req, res) => {
      res.render("components/drinks", {
         drinks: await drinksController.getDrinks(db),
         sizes: await sizesController.getDrinkSizes(db),
      });
   });
}