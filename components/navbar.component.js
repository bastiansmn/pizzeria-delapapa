module.exports = (app, db) => {
   app.get(
      "/components/navbar",
      (_req, res) => {
         res.render("navbar", { text: '1 acheté -> 1 offerte' });
      }
   );
}