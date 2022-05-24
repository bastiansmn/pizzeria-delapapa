const deliveryController = require('../controller/delivery');

module.exports = (app, db) => {
   app.put(
      "/pages/deliverer__access",
      async (_req, res) => {
         const orders = await deliveryController.getLastPendingOrders(db);
         res.render("pages/deliverer__access", {
            orders: orders.map(e => {
               return {
                  ...e,
                  date: new Date(e.date).toLocaleString()
               };
            })
         });
      }
   );
 }