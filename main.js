const express = require('express');
require('dotenv').config()
const app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({ extended: true }));
app.set("view engine", "ejs");

// Connect to DB with config
const { Client } = require('pg');
const dbConfig = require('./config/db.config');
const db = new Client(dbConfig);
db.connect();

require('./routes/user.route')(app, db);

app.listen(process.env.PORT || 3000);