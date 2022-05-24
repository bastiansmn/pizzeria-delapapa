const jwt = require("jsonwebtoken");
const query = require("../queries/auth.query");

module.exports = (app, db) => {
   app.put(
      "/pages/account",
      (req, res) => {
         jwt.verify(req.headers["x-access-token"], process.env.JWT_SECRET || "T3kdWp3PmYvrj9eJEaW9QFTDY3V7NmQ7", (err, decoded) => {
            if (err) {
               return res.status(401).send({
                  message: "Requête interdite"
               });
            }
            db.query(query.getByID(decoded.user_id))
               .then(result => {
                  const user = result.rows[0];
                  res.render("pages/account", {
                     user
                  });
               }).catch(err => {
                  console.error(err);
                  res.status(500).send(
                     "<div class='alert alert-danger' role='alert'>Erreur interne</div>"
                  );
               });
         });
      }
   );
}