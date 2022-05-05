const query = require("../queries/menu.query");
const { displayPrice } = require("../utils/numbers");

module.exports = {
   getProducts: (db) => {
      return new Promise(resolve => {
         db.query(query.getProducts)
            .then(res => {
               console.log(res.rows);
               resolve(res.rows.map(e => {
                  return {
                     // ... = spread les elements de e
                     ...e,
                     price: displayPrice(e.price),
                  }
               }));
            })
            .catch(err => {
               console.error(err);
               resolve(null);
            });
      });
   }
}
