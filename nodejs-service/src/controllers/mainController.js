var mainModel = require('../models/mainModel');
var adminModel = require('../models/adminModel');
var helper = require('../lib/helpers');
const helpers = require('../lib/helpers');
var mainController = function () { }
mainController.inicio = (req, res) => {
    if (!req.session.carrito) {
        req.session.carrito = {};
    }
    mainModel.novedades((err, rows) => {
        if (err) throw err;
        else {
            var size = 4;
            var books = [];
            for (var i = 0; i < rows.length; i += size) {
                books.push(rows.slice(i, i + size));
            }
            res.render("inicio", { style: "inicio.css", libros: books });
        }
    });
};
mainController.sucursal = (req, res) => {
    res.render("sucursal", { style: "sucursal.css" });
};
mainController.politica = (req, res) => {
    res.render("politica", { style: "politicas.css" });
};
mainController.contacto = (req, res) => {
    res.render("contacto", { style: "contacto.css" });
};
mainController.libros = async (req, res) => {
    const row = await mainModel.cantidadDeLibros();
    const { cantidad } = row[0];
    helpers.pagination(null, req, res, cantidad, "/libros", mainModel.libros);
};
mainController.categorias = async (req, res) => {
    const categorias = await adminModel.categorias();
    res.render("categorias", { style: "card_menu.css", categorias });
};
mainController.autores = async (req, res) => {
    const autores = await adminModel.autores();
    res.render("autores", { style: "card_menu.css", autores });
};
mainController.editoriales = async (req, res) => {
    const editoriales = await adminModel.editoriales();
    res.render("editoriales", { style: "card_menu.css", editoriales });
}
mainController.librosPorIDCategoria = (req, res) => {
    const { id } = req.params;
    mainModel.librosPorIDCategoria([id], (err, rows) => {
        if (rows.length > 0) {
            helpers.pagination(id, req, res, rows.length, "/categorias/" + id, mainModel.pagCategorias);
        } else {
            req.flash('error', 'No hay libros asociados');
            res.redirect('/categorias');
        }
    });
};
mainController.librosPorIDAutor = (req, res) => {
    const { id } = req.params;
    mainModel.librosPorIDAutor([id], (err, rows) => {
        if (rows.length > 0) {
            helpers.pagination(id, req, res, rows.length, "/autores/" + id, mainModel.pagAutores);
        } else {
            req.flash('error', 'No hay libros asociados');
            res.redirect('/autores');
        }
    });
};
mainController.librosPorIDEditorial = (req, res) => {
    const { id } = req.params;
    mainModel.librosPorIDEditorial([id], (err, rows) => {
        if (rows.length > 0) {
            helpers.pagination(id, req, res, rows.length, "/editoriales/" + id, mainModel.pagEditorial);
        } else {
            req.flash('error', 'No hay libros asociados');
            res.redirect('/editoriales');
        }
    });
};
mainController.librosBusqueda = (req, res) => {
    const { title } = req.params;
    const substr = '%'.concat(title.concat('%'));
    mainModel.librosBusqueda([substr], (err, rows) => {
        var libros;
        if (title.length == 0) {
            libros = [];
        }
        else libros = rows;
        helpers.pagination(substr, req, res, rows.length, "/buscar/" + title, mainModel.pagBusqueda);

    });
};
mainController.buscar = (req, res) => {
    const { search } = req.body;
    const route = "/buscar/".concat(search);
    res.redirect(route);
};
mainController.remates = (req, res) => {
    mainModel.remates((err, rows) => {
        if (err) {
            throw err;
        } else {
            res.render("remates", { style: "remates.css", remates: rows });
        }
    });
};
mainController.tecnologia = (req, res) => {
    mainModel.tecnologia((err, rows) => {
        if (err) {
            throw err;
        } else {
            res.render("tecnologia", { style: "tecnologia.css", tecnologia: rows });
        }
    });
};
mainController.libro = (req, res, next) => {
    const { id } = req.params;
    mainModel.libro([id], (err, rows) => {
        if (rows.length == 0) {
            next();
            return;
        } else res.render("libro", { style: "libro.css", libro: rows[0] });
    });
};
module.exports = mainController;