const jwt = require("jsonwebtoken");
const query = require("../queries/user.query");

module.exports = (app, db) => {
   app.post("/user/createAddress", (req, res) => {
      jwt.verify(req.headers["x-access-token"], process.env.JWT_SECRET || "T3kdWp3PmYvrj9eJEaW9QFTDY3V7NmQ7", async (err, decoded) => {
               if (err) {
                  return res.status(401).send({
                     message: "Impossible d'ajouter l'addresse"
                  });
               }
               db.query(query.createAddress(decoded.user_id, req.body.name_adr, req.body.opt))
                  .then(result => {
                     res.send(result.rows[0]);
                  })
                  .catch(err => {
                     console.error(err);
                  });
            });
   })
}