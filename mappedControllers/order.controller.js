const query = require("../queries/order.query");

module.exports = (app, db) => {
   app.post("/order/createOrder", (req, res) => {
      const { addressId } = req.body;
      db.query(query.createOrder(addressId))
         .then(result => {
            res.status(200).send(result.rows);
            // TODO: send confirmation mail
         })
         .catch(err => {
            console.error(err);
            res.status(500).send({
               message: err
            });
         });
   });
   app.post("/order/addItem", (req, res) => {
      console.log(req.body, req.body.order_id);
      db.query(query.insertItemToOrder(req.body.order_id, req.body.product_id, req.body.quant, req.body.type, req.body.pizza_size, req.body.sauce_name, req.body.drink_size))
         .then(result => {
            res.status(200).send(result.rows);
         })
         .catch(err => {
            console.error(err);
            res.status(500).send({
               message: err
            });
         })
   })
}