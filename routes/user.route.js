const user = require("../controller/user");
const userController = require("../controller/user");

module.exports = (app, db) => {
   app.get(
      "/home",
      async (_req, res) => {
         const users = await userController.getUsers(db);
         res.render("home", {
            users
         });
      }
   );
}