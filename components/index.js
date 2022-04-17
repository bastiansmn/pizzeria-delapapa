module.exports = (app, db) => {
   require("./home.component")(app, db);
   require("./menu.component")(app, db);
}