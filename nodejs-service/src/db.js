const mysql = require('mysql2/promise');
const { database } = require('./keys');

const pool = mysql.createPool(database);

(async () => {
    try {
        const conn = await pool.getConnection();
        console.log('Connected to database');
        conn.release();
    } catch (err) {
        console.error('Error connecting to database:', err);
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.error("CONNECTION LOST");
        } else if (err.code === 'ER_CON_COUNT_ERROR') {
            console.error("MANY CONNECTIONS");
        } else if (err.code === 'ECONNREFUSED') {
            console.error("CONN REFUSED");
        }
    }
})();

module.exports = pool;
