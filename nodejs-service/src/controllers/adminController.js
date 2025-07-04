var adminModel = require('../models/adminModel');

var adminController = function () { }
adminController.inicio = async (req, res) => {
    const categorias = await adminModel.categorias();
    const editoriales = await adminModel.editoriales();
    const autores = await adminModel.autores();
    res.render("tablas", { style: "tabla.css", layout: "admin", categorias, editoriales, autores });
};
adminController.libro = async (req, res) => {
    const categorias = await adminModel.categorias();
    const editoriales = await adminModel.editoriales();
    const autores = await adminModel.autores();
    res.render("admin_libro", { layout: "admin", categorias, editoriales, autores });
};
adminController.remates = (req, res) => {
    res.render("admin_remate", { layout: "admin" });
};
adminController.tec = (req, res) => {
    res.render("admin_tec", { layout: "admin" });
};
adminController.editoriales = (req, res) => {
    res.render("admin_editorial", { layout: "admin" });
};
adminController.categorias = (req, res) => {
    res.render("admin_categoria", { layout: "admin" });
};
adminController.autores = (req, res) => {
    res.render("admin_autor", { layout: "admin" });
};
adminController.agregarEditorial = (req, res) => {
    const { Nombre } = req.body;
    let editorial = { Nombre };
    adminModel.insertarEditorial([editorial], (err) => {
        if (err) {
            req.flash('error', 'Error al tratar de insertar');
        } else {
            req.flash('exito', 'Editorial agregada correctamente');
        }
        res.redirect('/admin/editorial');
    });
};
adminController.agregarCategoria = (req, res) => {
    const { Nombre } = req.body;
    let categoria = { Nombre };
    adminModel.insertarCategoria([categoria], (err) => {
        if (err) {
            req.flash('error', 'Error al tratar de insertar');
        } else {
            req.flash('exito', 'Categoría agregada correctamente');
        }
        res.redirect('/admin/categoria');
    });
};
adminController.agregarAutor = (req, res) => {
    const { Nombre } = req.body;
    let autor = { Nombre };
    adminModel.insertarAutor([autor], (err) => {
        if (err) {
            req.flash('error', 'Error al tratar de insertar');
        } else {
            req.flash('exito', 'Autor agregado correctamente');
        }
        res.redirect('/admin/autor');
    });
};
adminController.agregarLibro = (req, res) => {
    const { Nombre, Categoria, Autor, Anio, Editorial, Cantidad, Precio, Imagen } = req.body;
    let libro = { Nombre, Categoria, Autor, Anio, Editorial, Cantidad, Precio, Imagen };
    adminModel.insertarLibro([libro], (err) => {
        if (err) {
            req.flash('error', 'Error al tratar de insertar');
        } else {
            req.flash('exito', 'Libro agregado correctamente');
        }
        res.redirect('/admin/libros');
    });
};
adminController.agregarRemate = (req, res) => {
    const { Nombre_Remate, Precio, Cantidad, Imagen } = req.body;
    let remate = { Nombre_Remate, Precio, Cantidad, Imagen };
    adminModel.insertarRemate([remate], (err) => {
        if (err) {
            console.log(err);
            req.flash('error', 'Error al tratar de insertar');
        } else {
            req.flash('exito', 'Libro agregado correctamente');
        }
        res.redirect('/admin/remates');
    });
};
adminController.agregarTec = (req, res) => {
    const { Nombre_Tec, Precio, Cantidad, Imagen } = req.body;
    let remate = { Nombre_Tec, Precio, Cantidad, Imagen };
    adminModel.insertarTec([remate], (err) => {
        if (err) {
            console.log(err);
            req.flash('error', 'Error al tratar de insertar');
        } else {
            req.flash('exito', 'Libro agregado correctamente');
        }
        res.redirect('/admin/tec');
    });
};
adminController.eliminarCategoria = (req, res) => {
    const { id } = req.body;
    adminModel.eliminarCategoria([id], (err, rows) => {
        if (rows.affectedRows == 0) {
            req.flash('error', 'No existe categoría con ese ID');
        }
        res.redirect('/admin');
    });

};
adminController.eliminarEditorial = (req, res) => {
    const { id } = req.body;
    adminModel.eliminarEditorial([id], (err, rows) => {
        if (rows.affectedRows == 0) {
            req.flash('error', 'No existe editorial con ese ID');
        }
        res.redirect('/admin');
    });
};
adminController.eliminarAutor = (req, res) => {
    const { id } = req.body;
    adminModel.eliminarAutor([id], (err, rows) => {
        if (rows.affectedRows == 0) {
            req.flash('error', 'No existe autor con ese ID');
        }
        res.redirect('/admin');
    });
};
adminController.actualizarCategoria = (req, res) => {
    const { Nombre, id } = req.body;
    adminModel.actualizarCategoria(Nombre, id, (err, rows) => {
        if (err) {
            req.flash('error', 'Ocurrrión un error');
        }
        res.redirect('/admin');
    });
}
adminController.actualizarAutor = (req, res) => {
    const { Nombre, id } = req.body;
    adminModel.actualizarAutor(Nombre, id, (err, rows) => {
        if (err) {
            req.flash('error', 'Ocurrrión un error');
        }
        res.redirect('/admin');
    });
}
adminController.actualizarEditorial = (req, res) => {
    const { Nombre, id } = req.body;
    adminModel.actualizarEditorial(Nombre, id, (err, rows) => {
        if (err) {
            req.flash('error', 'Ocurrrión un error');
        }
        res.redirect('/admin');
    });
}
module.exports = adminController;