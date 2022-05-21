const express = require('express');
require('dotenv').config()
const app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));
app.set("view engine", "ejs");

// Connect to DB with config
const { Client } = require('pg');
const dbConfig = require('./config/db.config');
const db = new Client(dbConfig);
db.connect();

// Require components
require("./components")(app, db);

// Registering pages
require('./pages')(app, db);

// Require mapped controllers
require('./mappedControllers')(app, db);

app.listen(process.env.PORT || 3000);

// TODO: Page delivraison (vérif par webtoken si user est livreur) -> si oui lui envoyer le button d'affichage de la page de livraison
// TODO: Inscription/connexion
