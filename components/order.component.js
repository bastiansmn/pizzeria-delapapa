const userController = require("../controller/user");
const jwt = require("jsonwebtoken");
const { displayPrice } = require("../utils/numbers");

module.exports = (app, db) => {
   app.put("/components/order", (req, res) => {
      jwt.verify(req.headers["x-access-token"], process.env.JWT_SECRET || "T3kdWp3PmYvrj9eJEaW9QFTDY3V7NmQ7", async (err, decoded) => {
         if (err) {
            return res.status(401).send(
               "<div class='alert alert-danger' role='alert'>Interdit</div>"
            );
         }
         res.render("components/order", {
            cart: req.body.cart,
            total: displayPrice(req.body.cart.reduce((acc, item) => {
               return acc + item.quantity * item.price;
            }, 0)),
            address: await userController.getAddressOfUser(db, decoded.user_id)
         });
      });
      
   });
}