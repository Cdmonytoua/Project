const pool = require('../db');
const adminModel = {};

adminModel.categorias = async () => {
    const [rows] = await pool.query("SELECT * FROM categorias");
    return rows;
};
adminModel.editoriales = async () => {
    const [rows] = await pool.query("SELECT * FROM editoriales");
    return rows;
};
adminModel.autores = async () => {
    const [rows] = await pool.query("SELECT * FROM autores");
    return rows;
};

adminModel.insertarLibro = async (libro) => {
    const { Nombre, Categoria, Autor, Anio, Editorial, Cantidad, Precio, Imagen } = libro[0];
    return await pool.query("INSERT INTO libros (Nombre, Categoria, Autor, Anio, Editorial, Cantidad, Precio, Imagen) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
        [Nombre, Categoria, Autor, Anio, Editorial, Cantidad, Precio, Imagen]
    );
};

adminModel.insertarRemate = async (remate) => {
    const { Nombre_Remate, Precio, Cantidad, Imagen } = remate[0];
    return await pool.query("INSERT INTO remates (Nombre_Remate, Precio, Cantidad, Imagen) VALUES (?, ?, ?, ?)",
        [Nombre_Remate, Precio, Cantidad, Imagen]
    );
};

adminModel.insertarTec = async (tec) => {
    const { Nombre_Tec, Precio, Cantidad, Imagen } = tec[0];
    return await pool.query("INSERT INTO tecnologia (Nombre_Tec, Precio, Cantidad, Imagen) VALUES (?, ?, ?, ?)",
        [Nombre_Tec, Precio, Cantidad, Imagen]
    );
};

adminModel.insertarCategoria = async (categoria) => {
    const { Nombre } = categoria[0];
    return await pool.query("INSERT INTO categorias (Nombre) VALUES (?)", [Nombre]);
};

adminModel.insertarEditorial = async (editorial) => {
    const { Nombre } = editorial[0];
    return await pool.query("INSERT INTO editoriales (Nombre) VALUES (?)", [Nombre]);
};

adminModel.insertarAutor = async (autor) => {
    const { Nombre } = autor[0];
    return await pool.query("INSERT INTO autores (Nombre) VALUES (?)", [Nombre]);
};

adminModel.eliminarCategoria = async (id) => {
    return await pool.query("DELETE FROM categorias WHERE Id_Categoria = ?", [id]);
};

adminModel.eliminarEditorial = async (id) => {
    return await pool.query("DELETE FROM editoriales WHERE Id_Editorial = ?", [id]);
};

adminModel.eliminarAutor = async (id) => {
    return await pool.query("DELETE FROM autores WHERE Id_Autor = ?", [id]);
};

adminModel.eliminarLibro = async (id) => {
    return await pool.query("DELETE FROM libros WHERE Id_Libro = ?", [id]);
};

adminModel.actualizarCategoria = async (nombre, id) => {
    return await pool.query("UPDATE categorias SET Nombre = ? WHERE Id_Categoria = ?", [nombre, id]);
};

adminModel.actualizarEditorial = async (nombre, id) => {
    return await pool.query("UPDATE editoriales SET Nombre = ? WHERE Id_Editorial = ?", [nombre, id]);
};

adminModel.actualizarAutor = async (nombre, id) => {
    return await pool.query("UPDATE autores SET Nombre = ? WHERE Id_Autor = ?", [nombre, id]);
};

adminModel.getLibroById = async (id) => {
    return await pool.query("SELECT * FROM libros WHERE Id_Libro = ?", [id]);
};

adminModel.actualizarLibro = async (libro, id) => {
    const { Nombre, Categoria, Autor, Editorial, Anio, Cantidad, Precio, Imagen } = libro;
    return await pool.query(
        "UPDATE libros SET Nombre = ?, Categoria = ?, Autor = ?, Editorial = ?, Anio = ?, Cantidad = ?, Precio = ?, Imagen = ? WHERE Id_Libro = ?",
        [Nombre, Categoria, Autor, Editorial, Anio, Cantidad, Precio, Imagen, id]
    );
};

adminModel.getLibrosPaginados = async (offset, limit, search) => {
    let sql = `
    SELECT
      l.Id_Libro, l.Nombre, l.Anio, l.Precio, l.Cantidad, l.Imagen,
      a.Nombre AS Autor, e.Nombre AS Editorial, c.Nombre AS Categoria,
      l.Autor AS Autor_ID, l.Editorial AS Editorial_ID, l.Categoria AS Categoria_ID
    FROM libros l
    JOIN autores a     ON l.Autor     = a.Id_Autor
    JOIN editoriales e ON l.Editorial = e.Id_Editorial
    JOIN categorias c  ON l.Categoria = c.Id_Categoria
  `;
    const params = [];
    if (search) {
        sql += " WHERE l.Nombre LIKE ? OR a.Nombre LIKE ? OR e.Nombre LIKE ?";
        params.push(`%${search}%`, `%${search}%`, `%${search}%`);
    }
    sql += " ORDER BY l.Id_Libro DESC LIMIT ? OFFSET ?";
    params.push(limit, offset);
    const [rows] = await pool.query(sql, params);
    return rows;
};

adminModel.countLibros = async (search) => {
    let sql = `
    SELECT COUNT(*) AS count
    FROM libros l
    JOIN autores a     ON l.Autor     = a.Id_Autor
    JOIN editoriales e ON l.Editorial = e.Id_Editorial
  `;
    const params = [];
    if (search) {
        sql += " WHERE l.Nombre LIKE ? OR a.Nombre LIKE ? OR e.Nombre LIKE ?";
        params.push(`%${search}%`, `%${search}%`, `%${search}%`);
    }
    const [rows] = await pool.query(sql, params);
    return rows;
};

module.exports = adminModel;
