const query = require("../queries/delivrer.query");

module.exports = {
   getLastPendingOrders: (db) => {
      return new Promise(resolve => {
         db.query(query.getLastPendingOrders)
            .then(result => {
               resolve(result.rows);
            })
            .catch(err => {
               console.error(err);
            });
      })
   }
}