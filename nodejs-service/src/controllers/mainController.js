const mainModel = require('../models/mainModel');
const adminModel = require('../models/adminModel');
const helpers = require('../lib/helpers');
const { param, body, validationResult } = require('express-validator');

const mainController = {};

mainController.inicio = async (req, res) => {
    try {
        if (!req.session.carrito) {
            req.session.carrito = {};
        }
        const rows = await mainModel.novedades();
        const size = 4;
        const books = [];
        for (let i = 0; i < rows.length; i += size) {
            books.push(rows.slice(i, i + size));
        }
        res.render("inicio", { style: "inicio.css", libros: books });
    } catch (error) {
        req.flash('error', 'Error al cargar la página de inicio.');
        res.redirect('/');
    }
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
    try {
        const row = await mainModel.cantidadDeLibros();
        const { cantidad } = row[0];
        helpers.pagination(null, req, res, cantidad, "/libros", mainModel.libros);
    } catch (error) {
        req.flash('error', 'Error al cargar los libros.');
        res.redirect('/');
    }
};

mainController.categorias = async (req, res) => {
    try {
        const categorias = await adminModel.categorias();
        res.render("categorias", { style: "card_menu.css", categorias });
    } catch (error) {
        req.flash('error', 'Error al cargar las categorías.');
        res.redirect('/');
    }
};

mainController.autores = async (req, res) => {
    try {
        const autores = await adminModel.autores();
        res.render("autores", { style: "card_menu.css", autores });
    } catch (error) {
        req.flash('error', 'Error al cargar los autores.');
        res.redirect('/');
    }
};

mainController.editoriales = async (req, res) => {
    try {
        const editoriales = await adminModel.editoriales();
        res.render("editoriales", { style: "card_menu.css", editoriales });
    } catch (error) {
        req.flash('error', 'Error al cargar las editoriales.');
        res.redirect('/');
    }
};

mainController.librosPorIDCategoria = [
    param('id').isInt().withMessage('ID de categoría inválido.'),
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('/categorias');
        }
        try {
            const { id } = req.params;
            const rows = await mainModel.librosPorIDCategoria(id);
            if (rows.length > 0) {
                helpers.pagination(id, req, res, rows.length, "/categorias/" + id, mainModel.pagCategorias);
            } else {
                req.flash('error', 'No hay libros asociados');
                res.redirect('/categorias');
            }
        } catch (error) {
            req.flash('error', 'Error al cargar los libros por categoría.');
            res.redirect('/categorias');
        }
    }
];

mainController.librosPorIDAutor = [
    param('id').isInt().withMessage('ID de autor inválido.'),
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('/autores');
        }
        try {
            const { id } = req.params;
            const rows = await mainModel.librosPorIDAutor(id);
            if (rows.length > 0) {
                helpers.pagination(id, req, res, rows.length, "/autores/" + id, mainModel.pagAutores);
            } else {
                req.flash('error', 'No hay libros asociados');
                res.redirect('/autores');
            }
        } catch (error) {
            req.flash('error', 'Error al cargar los libros por autor.');
            res.redirect('/autores');
        }
    }
];

mainController.librosPorIDEditorial = [
    param('id').isInt().withMessage('ID de editorial inválido.'),
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('/editoriales');
        }
        try {
            const { id } = req.params;
            const rows = await mainModel.librosPorIDEditorial(id);
            if (rows.length > 0) {
                helpers.pagination(id, req, res, rows.length, "/editoriales/" + id, mainModel.pagEditorial);
            } else {
                req.flash('error', 'No hay libros asociados');
                res.redirect('/editoriales');
            }
        } catch (error) {
            req.flash('error', 'Error al cargar los libros por editorial.');
            res.redirect('/editoriales');
        }
    }
];

mainController.librosBusqueda = [
    param('title').trim().escape(),
    async (req, res) => {
        try {
            const { title } = req.params;
            const substr = `%${title}%`;
            const rows = await mainModel.librosBusqueda(substr);
            helpers.pagination(substr, req, res, rows.length, "/buscar/" + title, mainModel.pagBusqueda);
        } catch (error) {
            req.flash('error', 'Error al realizar la búsqueda.');
            res.redirect('/');
        }
    }
];

mainController.buscar = [
    body('search').notEmpty().withMessage('El término de búsqueda no puede estar vacío.').trim().escape(),
    (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('back');
        }
        const { search } = req.body;
        res.redirect(`/buscar/${search}`);
    }
];

mainController.remates = async (req, res) => {
    try {
        const rows = await mainModel.remates();
        res.render("remates", { style: "remates.css", remates: rows });
    } catch (error) {
        req.flash('error', 'Error al cargar los remates.');
        res.redirect('/');
    }
};

mainController.tecnologia = async (req, res) => {
    try {
        const rows = await mainModel.tecnologia();
        res.render("tecnologia", { style: "tecnologia.css", tecnologia: rows });
    } catch (error) {
        req.flash('error', 'Error al cargar los productos de tecnología.');
        res.redirect('/');
    }
};

mainController.libro = [
    param('id').isInt().withMessage('ID de libro inválido.'),
    async (req, res, next) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('/libros');
        }
        try {
            const { id } = req.params;
            const rows = await mainModel.libro(id);
            if (rows.length === 0) {
                return next();
            }
            res.render("libro", { style: "libro.css", libro: rows[0] });
        } catch (error) {
            req.flash('error', 'Error al cargar el libro.');
            res.redirect('/libros');
        }
    }
];

module.exports = mainController;
