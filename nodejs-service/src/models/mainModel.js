const pool = require('../db');
const mainModel = {};

mainModel.libros = async (limit, offset) => {
    const [rows] = await pool.query("SELECT * FROM libros LIMIT ? OFFSET ?", [limit, offset]);
    return rows;
};

mainModel.cantidadDeLibros = async (search) => {
    let sql = "SELECT COUNT(*) AS cantidad FROM libros";
    const params = [];
    if (search) {
        sql += " WHERE nombre LIKE ?";
        params.push(`%${search}%`);
    }
    const [rows] = await pool.query(sql, params);
    return rows;
};

mainModel.pagCategorias = async (id, limit, offset) => {
    const [rows] = await pool.query(
        "SELECT * FROM libros WHERE categoria = ? LIMIT ? OFFSET ?",
        [id, limit, offset]
    );
    return rows;
};

mainModel.pagAutores = async (id, limit, offset) => {
    const [rows] = await pool.query(
        "SELECT * FROM libros WHERE autor = ? LIMIT ? OFFSET ?",
        [id, limit, offset]
    );
    return rows;
};

mainModel.pagEditorial = async (id, limit, offset) => {
    const [rows] = await pool.query(
        "SELECT * FROM libros WHERE editorial = ? LIMIT ? OFFSET ?",
        [id, limit, offset]
    );
    return rows;
};

mainModel.pagBusqueda = async (substr, limit, offset) => {
    const searchTerm = `%${substr}%`;
    const [rows] = await pool.query(
        "SELECT * FROM libros WHERE nombre LIKE ? LIMIT ? OFFSET ?",
        [searchTerm, limit, offset]
    );
    return rows;
};

mainModel.librosPorIDCategoria = async (id) => {
    const [rows] = await pool.query("SELECT * FROM libros WHERE categoria = ?", [id]);
    return rows;
};

mainModel.librosPorIDAutor = async (id) => {
    const [rows] = await pool.query("SELECT * FROM libros WHERE autor = ?", [id]);
    return rows;
};

mainModel.librosPorIDEditorial = async (id) => {
    const [rows] = await pool.query("SELECT * FROM libros WHERE editorial = ?", [id]);
    return rows;
};

mainModel.librosBusqueda = async (substr) => {
    const searchTerm = `%${substr}%`;
    const [rows] = await pool.query("SELECT * FROM libros WHERE nombre LIKE ?", [searchTerm]);
    return rows;
};

mainModel.remates = async () => {
    const [rows] = await pool.query("SELECT * FROM remates");
    return rows;
};

mainModel.tecnologia = async () => {
    const [rows] = await pool.query("SELECT * FROM tecnologia");
    return rows;
};

mainModel.novedades = async () => {
    const [rows] = await pool.query("SELECT * FROM libros ORDER BY Id_Libro DESC LIMIT 12");
    return rows;
};

mainModel.libro = async (id) => {
    const [rows] = await pool.query("SELECT * FROM libros WHERE Id_Libro = ?", [id]);
    return rows;
};

module.exports = mainModel;