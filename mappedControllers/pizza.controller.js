const query = require("../queries/menu.query");

module.exports =  (app, db) => {
   app.post("/pizza/createCustom", (req, res) => {
      // TODO
      const pizza = {
         name: req.body.name,
         price: req.body.price,
         description: req.body.size,
      }

      db.query(query.createCustomPizza(pizza))
         .then(result => {
            const pizza = result.rows[0];
            req.body.ingredients.forEach(i => {
               db.query(query.addIngredientToPizza(pizza.id, i.name, 1))
            });
            res.status(200).send(pizza)
         })
         .catch(err => {
            console.error(err);
            res.status(500).send({
               message: "Impossible de créer la pizza",
            })
         });
   });
}