const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// Conexión a la base de datos MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'komalli-user',
    password: 'KomalliUV-password2026',
    database: 'komalli_db' 
});

db.connect(err => {
    if (err) {
        console.error('Error conectando a la BD:', err);
        return;
    }
    console.log('Base de datos conectada para Fase Manual');
});

// Endpoint de prueba para verificar que el servidor funciona
app.get('/', (req, res) => {
    res.send('Servidor de la Fase Manual corriendo correctamente');
});

//Definir endpoints según sea necesario

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Servidor Backend Manual en puerto ${PORT}`);
});