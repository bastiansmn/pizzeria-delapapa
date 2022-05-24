module.exports = (app, db) => {
   app.put(
      "/pages/menu",
      (_req, res) => {
         res.render("pages/menu");
      }
   );
}