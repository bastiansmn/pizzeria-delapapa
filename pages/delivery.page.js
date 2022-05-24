module.exports = (app, db) => {
    app.put(
       "/pages/delivery",
       (_req, res) => {
          res.render("pages/delivery");
       }
    );
 }