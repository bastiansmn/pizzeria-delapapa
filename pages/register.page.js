module.exports = (app, db) => {
    app.put(
       "/pages/register",
       (_req, res) => {
          res.render("pages/register");
       }
    );
 }