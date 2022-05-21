const ingredientsController = require('../controller/ingredients');
const sizesController = require('../controller/sizes');

module.exports = (app, db) => {
   app.put("/components/customPizza", async (_req, res) => {
      // For all types available in the database, get the ingredients for each type
      const types = await ingredientsController.getTypes(db);
      const ingredients = {};
      for (let {ingr_type} of types) {
         ingredients[ingr_type] = await ingredientsController.getIngredientsOfType(db, ingr_type);
      }
      const sizes = await sizesController.getPizzaSizes(db);
      res.render("components/customPizza", {
         ingredients,
         sizes
      });
   });
}