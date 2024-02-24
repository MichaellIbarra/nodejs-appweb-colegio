// config/database.js
const mysql = require("mysql");

const conex = mysql.createConnection({
  host: "localhost",
  database: "cni_crud",
  user: "root",
  password: "",
});

conex.connect((err) => {
  if (err) throw err;
  console.log("Conexión a la base de datos establecida");
});

module.exports = conex;
