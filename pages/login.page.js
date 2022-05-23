module.exports = (app, db) => {
    app.get(
       "/pages/login",
       (_req, res) => {
          res.render("pages/login");
       }
    );
 }