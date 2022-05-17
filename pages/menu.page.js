module.exports = (app, db) => {
   app.get(
      "/pages/menu",
      (_req, res) => {
         res.render("pages/menu");
      }
   );
}