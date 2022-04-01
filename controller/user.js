const query = require("../queries/user.query");

module.exports = {
   getUsers: (db) => {
      return new Promise(resolve => {
         db.query(query.getUsers)
            .then(res => {
               resolve(res.rows);
            })
            .catch(err => {
               console.error(err);
               resolve(null);
            });
      });
   }
}