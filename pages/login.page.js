module.exports = (app, db) => {
    app.put(
       "/pages/login",
       (_req, res) => {
          res.render("pages/login");
       }
    );
 }