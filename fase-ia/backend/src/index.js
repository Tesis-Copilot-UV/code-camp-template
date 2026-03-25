const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// Ejemplo de cómo conectar a la base de datos usando el módulo de configuración
// const { createConnection } = require('./config/db.config');
// const db = createConnection();
// db.connect((err) => { ... });

// Endpoint de prueba para verificar que el servidor funciona
app.get('/', (req, res) => {
    res.send('Servidor de la Fase IA corriendo correctamente');
});

// Definir endpoints siguiendo el patron MVC

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
    console.log(`Servidor Backend IA en puerto ${PORT}`);
});