const query = require('../queries/sizes.query')

module.exports = {
   getPizzaSizes: (db) => {
      return new Promise(resolve => {
         db.query(query.getPizzaSizes)
            .then(result => {
               resolve(result.rows);
            })
            .catch(err => {
               console.error(err);
               resolve([]);
            });
      })
   },
   getDrinkSizes: (db) => {
      return new Promise(resolve => {
         db.query(query.getDrinkSizes)
            .then(result => {
               resolve(result.rows);
            })
            .catch(err => {
               console.error(err);
               resolve([]);
            });
      })
   }
}