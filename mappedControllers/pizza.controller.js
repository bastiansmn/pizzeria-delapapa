const query = require("../queries/menu.query");

module.exports =  (app, db) => {
   app.post("/pizza/createCustom", (req, res) => {
      // TODO
      console.log(req.body);
      const pizza = {
         name: req.body.name,
         price: req.body.price,
         description: req.body.size,
      }

      console.log(req.body.ingredients);
      console.log(query.createCustomPizza(pizza));
      db.query(query.createCustomPizza(pizza))
         .then(result => {
            console.log(result);
            res.send({
               pizza: "cc",
            })
         })
         .catch(err => {
            console.log(err);
            res.status(500).send({
               message: "Impossible de créer la pizza",
            })
         });
   });
}