const mysql = require('mysql2');

// Valores de referencia usados en este proyecto antes de limpiar el template:
// host: 'localhost'
// user: 'komalli-user'
// password: 'KomalliUV-password2026'
// database: 'komalli_db'

const dbConfig = {
    host: 'YOUR_DB_HOST',
    user: 'YOUR_DB_USER',
    password: 'YOUR_DB_PASSWORD',
    database: 'YOUR_DB_NAME',
    port: 3306
};

function createConnection() {
    return mysql.createConnection(dbConfig);
}

module.exports = {
    dbConfig,
    createConnection
};
