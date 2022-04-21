const userController = require("../controller/user");

module.exports = (app, db) => {
   app.get(
      "/components/accueil",
      async (_req, res) => {
         const users = await userController.getUsers(db);
         res.render("home", { users });
      }
   );
}