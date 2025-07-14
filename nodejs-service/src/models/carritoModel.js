const pool = require('../db');
const carritoModel = {};

const allowedTables = {
    libros: 'Id_Libro',
    remates: 'Id_Remate',
    tecnologia: 'Id_Tecnologia'
};

async function fetchByIds(table, ids) {
    if (!allowedTables[table]) {
        throw new Error(`Tabla no permitida: ${table}`);
    }
    if (!Array.isArray(ids) || ids.length === 0) {
        return [];
    }

    const column = allowedTables[table];
    const sql = pool.format('SELECT * FROM ?? WHERE ?? IN (?)', [table, column, ids]);

    const [rows] = await pool.query(sql);
    return rows;
}

carritoModel.carritoLibros = async (ids) => {
    return await fetchByIds('libros', ids);
};

carritoModel.carritoRemates = async (ids) => {
    return await fetchByIds('remates', ids);
};

carritoModel.carritoTecnologia = async (ids) => {
    return await fetchByIds('tecnologia', ids);
};

carritoModel.precioLibro = async (id) => {
    const sql = 'SELECT Precio FROM libros WHERE Id_Libro = ?';
    const [rows] = await pool.query(sql, [id]);
    return rows;
};

module.exports = carritoModel;