module.exports = (app, _db) => {
   app.put("/components/cart", (req, res) => {
      res.render("components/cart", {
         items: req.body.items,
         total: req.body.items.reduce((acc, item) => {
            return acc + (item.price * item.quant);
         }, 0),
      });
   });
}