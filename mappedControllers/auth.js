const jwt = require("jsonwebtoken");

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
         req.user_id = decoded.user_id;
         res.status(200).render("components/deliveryAccess");
      });
   });
   app.get("/signin", (req, res) => {

   });
   app.post("/signup", (req, res) => {

   });
}