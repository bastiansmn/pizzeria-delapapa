const { displayPrice } = require('../utils/numbers');

module.exports = (app, _db) => {
   app.put("/components/customPizza", (req, res) => {
      res.render("components/customPizza");
   });
}