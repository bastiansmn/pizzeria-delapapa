const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const query = require("../queries/auth.query");

module.exports = (app, db) => {
   app.get("/auth", (req, res) => {
      let token = req.headers["x-access-token"];
      if (!token) {
         return res.status(403).send({
            message: "Aucun token renseigné"
         });
      }
      jwt.verify(token, process.env.JWT_SECRET || "T3kdWp3PmYvrj9eJEaW9QFTDY3V7NmQ7", (err, decoded) => {
         if (err) {
            return res.status(401).send({
               message: "Requête interdite"
            });
         }
         db.query(query.getByID(decoded.user_id))
            .then(result => {
               const user = result.rows[0];
               if (user.is_deliverer) {
                  res.render("components/deliveryAccess");
               } else {
                  res.render("components/userAccess");
               }
            }).catch(err => {
               console.error(err);
               res.status(500).send({
                  message: "Erreur interne"
               });
            });
      });
   });
   app.post("/signin", (req, res) => {
      if (!req.body.email || !req.body.password) {
         return res.status(400).send({
            message: "Requête invalide"
         });
      }
      
      db.query(query.getByEmail(req.body.email))
         .then(result => {
            const user = result.rows[0];
            const passwordIsValid = bcrypt.compareSync(
               req.body.password,
               user.password
            );
            if (!passwordIsValid) {
               return res.status(401).send({
                  message: "Mot de passe ou email invalide"
               });
            }
            const token = jwt.sign({ user_id: user.id }, process.env.JWT_SECRET || "T3kdWp3PmYvrj9eJEaW9QFTDY3V7NmQ7", {
               expiresIn: 3600 * 24 * 31 // 1 Month
            });
            res.status(200).send({
               token
            });
         })
      
   });
   app.post("/signup", async (req, res) => {
      req.body.password = bcrypt.hashSync(req.body.password, 8);
      const tempUser = (await db.query(query.getByEmail(req.body.email))).rows[0];
      console.log(tempUser);
      if (tempUser) {
         return res.status(409).send({
            message: "Cet utilisateur existe déjà"
         });
      }
      db.query(query.saveUser(req.body))
         .then(result => {
            const user = result.rows[0];
            const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET || "T3kdWp3PmYvrj9eJEaW9QFTDY3V7NmQ7", {
               expiresIn: 3600 * 24 * 31 // 1 Month
            });
            res.send({
               token
            });
         })
   });
}