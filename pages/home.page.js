const userController = require("../controller/user");

module.exports = (app, db) => {
   app.put(
      "/pages/accueil",
      async (_req, res) => {
         const users = await userController.getUsers(db);
         res.render("pages/home", { users });
      }
   );
}