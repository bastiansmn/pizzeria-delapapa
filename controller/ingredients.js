const query = require('../queries/ingredient.query');

module.exports = {
   getTypes: (db) => {
      return new Promise(resolve => {
         db.query(query.getTypes)
            .then(result => resolve(result.rows))
            .catch(err => console.log(err));
      });
   },
   getIngredientsOfType: (db, type) => {
      return new Promise(resolve => {
         db.query(query.getIngredientsOfType(type))
            .then(result => resolve(result.rows))
            .catch(err => console.log(err));
      });
   }
}