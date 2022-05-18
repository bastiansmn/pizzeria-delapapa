const query = require("../queries/menu.query");
const { displayPrice } = require("../utils/numbers");

module.exports = {
   getMenus: (db) => {
      return new Promise(resolve => {
         db.query(query.getMenus)
            .then(result => {
               resolve(result.rows.map(e => {
                  return {
                     ...e,
                     displayedPrice: displayPrice(e.price),
                  };
               }));
            })
            .catch(err => {
               console.error(err);
            });
      })
   },
   getPizzas: (db) => {
      return new Promise(resolve => {
         db.query(query.getPizzas)
            .then(res => {
               resolve(res.rows.map(e => {
                  return {
                     // ... = spread les elements de e
                     ...e,
                     displayedPrice: displayPrice(e.price),
                  }
               }));
            })
            .catch(err => {
               console.error(err);
               resolve(null);
            });
      });
   },
   getStarters: (db) => {
      return new Promise(resolve => {
         db.query(query.getStarters)
            .then(res => {
               resolve(res.rows.map(e => {
                  return {
                     // ... = spread les elements de e
                     ...e,
                     displayedPrice: displayPrice(e.price),
                  }
               }));
            })
            .catch(err => {
               console.error(err);
               resolve(null);
            });
      });
   },
   getSauces: (db) => {
      return new Promise(resolve => {
         db.query(query.getSauces)
            .then(res => {
               resolve(res.rows);
            })
            .catch(err => {
               console.error(err);
               resolve(null);
            });
      });
   },
   getDrinks: (db) => {
      return new Promise(resolve => {
         db.query(query.getDrinks)
            .then(res => {
               resolve(res.rows.map(e => {
                  return {
                     // ... = spread les elements de e
                     ...e,
                     displayedPrice: displayPrice(e.price),
                  }
               }));
            })
            .catch(err => {
               console.error(err);
               resolve(null);
            });
      });
   },
}
