const starterController = require("../controller/menu");

module.exports = (app, db) => {
   app.put("/components/starters", async (_req, res) => {
      res.render("components/starters", {
         starters: await starterController.getStarters(db),
         sauces: await starterController.getSauces(db),
      });
   });
}