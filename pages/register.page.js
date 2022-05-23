module.exports = (app, db) => {
    app.get(
       "/pages/register",
       (_req, res) => {
          res.render("pages/register");
       }
    );
 }