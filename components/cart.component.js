const { displayPrice } = require('../utils/numbers');

module.exports = (app, _db) => {
   app.put("/components/cart", (req, res) => {
      res.render("components/cart", {
         items: req.body.items,
         total: displayPrice(req.body.items.reduce((acc, item) => {
            return acc + (item.price * item.quantity);
         }, 0)),
      });
   });
}