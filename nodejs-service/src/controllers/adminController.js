const adminModel = require('../models/adminModel');
const { body, validationResult } = require('express-validator');

const adminController = {};

adminController.inicio = async (req, res) => {
    try {
        const [categorias, editoriales, autores] = await Promise.all([
            adminModel.categorias(),
            adminModel.editoriales(),
            adminModel.autores()
        ]);
        res.render("tablas", { style: "tabla.css", layout: "admin", categorias, editoriales, autores });
    } catch (error) {
        req.flash('error', 'Error al cargar los datos iniciales.');
        res.redirect('/');
    }
};

adminController.libro = async (req, res) => {
    try {
        const [categorias, editoriales, autores] = await Promise.all([
            adminModel.categorias(),
            adminModel.editoriales(),
            adminModel.autores()
        ]);
        res.render("admin_libro", { layout: "admin", categorias, editoriales, autores });
    } catch (error) {
        req.flash('error', 'Error al cargar los datos para agregar un libro.');
        res.redirect('/admin/libros');
    }
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

adminController.agregarEditorial = [
    body('Nombre').notEmpty().withMessage('El nombre es obligatorio.').trim().escape(),
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('/admin/editorial');
        }
        try {
            const { Nombre } = req.body;
            await adminModel.insertarEditorial([{ Nombre }]);
            req.flash('exito', 'Editorial agregada correctamente');
            res.redirect('/admin/editorial');
        } catch (error) {
            req.flash('error', 'Error al tratar de insertar');
            res.redirect('/admin/editorial');
        }
    }
];

adminController.agregarCategoria = [
    body('Nombre').notEmpty().withMessage('El nombre es obligatorio.').trim().escape(),
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('/admin/categoria');
        }
        try {
            const { Nombre } = req.body;
            await adminModel.insertarCategoria([{ Nombre }]);
            req.flash('exito', 'Categoría agregada correctamente');
            res.redirect('/admin/categoria');
        } catch (error) {
            req.flash('error', 'Error al tratar de insertar');
            res.redirect('/admin/categoria');
        }
    }
];

adminController.agregarAutor = [
    body('Nombre').notEmpty().withMessage('El nombre es obligatorio.').trim().escape(),
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('/admin/autor');
        }
        try {
            const { Nombre } = req.body;
            await adminModel.insertarAutor([{ Nombre }]);
            req.flash('exito', 'Autor agregado correctamente');
            res.redirect('/admin/autor');
        } catch (error) {
            req.flash('error', 'Error al tratar de insertar');
            res.redirect('/admin/autor');
        }
    }
];

adminController.agregarLibro = [
    body('Nombre').notEmpty().withMessage('El nombre es obligatorio.').trim().escape(),
    body('Categoria').notEmpty().withMessage('La categoría es obligatoria.').isInt().withMessage('ID de categoría inválido.'),
    body('Autor').notEmpty().withMessage('El autor es obligatorio.').isInt().withMessage('ID de autor inválido.'),
    body('Anio').notEmpty().withMessage('El año es obligatorio.').isInt({ min: 1000, max: new Date().getFullYear() }).withMessage('Año inválido.'),
    body('Editorial').notEmpty().withMessage('La editorial es obligatoria.').isInt().withMessage('ID de editorial inválido.'),
    body('Cantidad').notEmpty().withMessage('La cantidad es obligatoria.').isInt({ min: 0 }).withMessage('Cantidad inválida.'),
    body('Precio').notEmpty().withMessage('El precio es obligatorio.').isFloat({ min: 0 }).withMessage('Precio inválido.'),
    body('Imagen').optional({ checkFalsy: true }).trim().escape(),
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('/admin/libros');
        }
        try {
            const { Nombre, Categoria, Autor, Anio, Editorial, Cantidad, Precio, Imagen } = req.body;
            await adminModel.insertarLibro([{ Nombre, Categoria, Autor, Anio, Editorial, Cantidad, Precio, Imagen }]);
            req.flash('exito', 'Libro agregado correctamente');
            res.redirect('/admin/libros');
        } catch (error) {
            req.flash('error', 'Error al tratar de insertar');
            res.redirect('/admin/libros');
        }
    }
];

adminController.agregarRemate = [
    body('Nombre_Remate').notEmpty().withMessage('El nombre es obligatorio.').trim().escape(),
    body('Precio').notEmpty().withMessage('El precio es obligatorio.').isFloat({ min: 0 }).withMessage('Precio inválido.'),
    body('Cantidad').notEmpty().withMessage('La cantidad es obligatoria.').isInt({ min: 0 }).withMessage('Cantidad inválida.'),
    body('Imagen').optional({ checkFalsy: true }).trim().escape(),
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('/admin/remates');
        }
        try {
            const { Nombre_Remate, Precio, Cantidad, Imagen } = req.body;
            await adminModel.insertarRemate([{ Nombre_Remate, Precio, Cantidad, Imagen }]);
            req.flash('exito', 'Remate agregado correctamente');
            res.redirect('/admin/remates');
        } catch (error) {
            req.flash('error', 'Error al tratar de insertar');
            res.redirect('/admin/remates');
        }
    }
];

adminController.agregarTec = [
    body('Nombre_Tec').notEmpty().withMessage('El nombre es obligatorio.').trim().escape(),
    body('Precio').notEmpty().withMessage('El precio es obligatorio.').isFloat({ min: 0 }).withMessage('Precio inválido.'),
    body('Cantidad').notEmpty().withMessage('La cantidad es obligatoria.').isInt({ min: 0 }).withMessage('Cantidad inválida.'),
    body('Imagen').optional({ checkFalsy: true }).trim().escape(),
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('/admin/tec');
        }
        try {
            const { Nombre_Tec, Precio, Cantidad, Imagen } = req.body;
            await adminModel.insertarTec([{ Nombre_Tec, Precio, Cantidad, Imagen }]);
            req.flash('exito', 'Producto de tecnología agregado correctamente');
            res.redirect('/admin/tec');
        } catch (error) {
            req.flash('error', 'Error al tratar de insertar');
            res.redirect('/admin/tec');
        }
    }
];

adminController.eliminarCategoria = async (req, res) => {
    try {
        const { id } = req.body;
        const [result] = await adminModel.eliminarCategoria(id);
        if (result.affectedRows === 0) {
            req.flash('error', 'No existe categoría con ese ID');
        } else {
            req.flash('exito', 'Categoría eliminada correctamente');
        }
        res.redirect('/admin');
    } catch (error) {
        req.flash('error', 'Error al eliminar la categoría.');
        res.redirect('/admin');
    }
};

adminController.eliminarEditorial = async (req, res) => {
    try {
        const { id } = req.body;
        const [result] = await adminModel.eliminarEditorial(id);
        if (result.affectedRows === 0) {
            req.flash('error', 'No existe editorial con ese ID');
        } else {
            req.flash('exito', 'Editorial eliminada correctamente');
        }
        res.redirect('/admin');
    } catch (error) {
        req.flash('error', 'Error al eliminar la editorial.');
        res.redirect('/admin');
    }
};

adminController.eliminarAutor = async (req, res) => {
    try {
        const { id } = req.body;
        const [result] = await adminModel.eliminarAutor(id);
        if (result.affectedRows === 0) {
            req.flash('error', 'No existe autor con ese ID');
        } else {
            req.flash('exito', 'Autor eliminado correctamente');
        }
        res.redirect('/admin');
    } catch (error) {
        req.flash('error', 'Error al eliminar el autor.');
        res.redirect('/admin');
    }
};

adminController.actualizarCategoria = [
    body('Nombre').notEmpty().withMessage('El nombre es obligatorio.').trim().escape(),
    body('id').notEmpty().withMessage('El ID es obligatorio.').isInt().withMessage('ID inválido.'),
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('/admin');
        }
        try {
            const { Nombre, id } = req.body;
            await adminModel.actualizarCategoria(Nombre, id);
            req.flash('exito', 'Categoría actualizada correctamente');
            res.redirect('/admin');
        } catch (error) {
            req.flash('error', 'Ocurrió un error al actualizar');
            res.redirect('/admin');
        }
    }
];

adminController.actualizarAutor = [
    body('Nombre').notEmpty().withMessage('El nombre es obligatorio.').trim().escape(),
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('/admin/autores');
        }
        try {
            const { id } = req.params;
            const { Nombre } = req.body;
            await adminModel.actualizarAutor(Nombre, id);
            req.flash('exito', 'Autor actualizado correctamente.');
            res.redirect('/admin/autores');
        } catch (error) {
            req.flash('error', 'Error al actualizar el autor.');
            res.redirect('/admin/autores');
        }
    }
];

adminController.libros = async (req, res) => {
    const page = parseInt(req.query.page) || 1;
    const limit = 10;
    const offset = (page - 1) * limit;
    const search = req.query.search || '';

    try {
        const [libros, total, categorias, autores, editoriales] = await Promise.all([
            adminModel.getLibrosPaginados(offset, limit, search),
            adminModel.countLibros(search),
            adminModel.categorias(),
            adminModel.autores(),
            adminModel.editoriales()
        ]);

        const totalPages = Math.ceil(total[0].count / limit);
        const range = 2;
        let pagesToShow = [];

        for (let i = 1; i <= totalPages; i++) {
            if (i === 1 || i === totalPages || (i >= page - range && i <= page + range)) {
                pagesToShow.push(i);
            }
        }

        let pages = [];
        let lastPage = 0;
        for (const p of pagesToShow) {
            if (lastPage) {
                if (p > lastPage + 1) {
                    pages.push({ num: '...', isEllipsis: true });
                }
            }
            pages.push({ num: p, isEllipsis: false });
            lastPage = p;
        }

        res.render('admin_libros', {
            layout: 'admin',
            style: 'tabla.css',
            libros: libros,
            currentPage: page,
            pages: pages,
            search: search,
            categorias: categorias,
            autores: autores,
            editoriales: editoriales,
            prevPage: page > 1 ? page - 1 : null,
            nextPage: page < totalPages ? page + 1 : null
        });
    } catch (error) {
        req.flash('error', 'Error al cargar los libros.');
        res.redirect('/admin');
    }
};

adminController.eliminarLibro = async (req, res) => {
    try {
        const { id } = req.params;
        await adminModel.eliminarLibro(id);
        req.flash('exito', 'Libro eliminado correctamente.');
        res.redirect('/admin/libros');
    } catch (error) {
        req.flash('error', 'Error al eliminar el libro.');
        res.redirect('/admin/libros');
    }
};

adminController.editarLibro = (req, res) => {
    res.redirect('/admin/libros');
};

adminController.actualizarLibro = [
    body('Nombre').notEmpty().withMessage('El nombre es obligatorio.').trim().escape(),
    body('Categoria').notEmpty().withMessage('La categoría es obligatoria.').isInt().withMessage('ID de categoría inválido.'),
    body('Autor').notEmpty().withMessage('El autor es obligatorio.').isInt().withMessage('ID de autor inválido.'),
    body('Editorial').notEmpty().withMessage('La editorial es obligatoria.').isInt().withMessage('ID de editorial inválido.'),
    body('Anio').notEmpty().withMessage('El año es obligatorio.').isInt({ min: 1000, max: new Date().getFullYear() }).withMessage('Año inválido.'),
    body('Cantidad').notEmpty().withMessage('La cantidad es obligatoria.').isInt({ min: 0 }).withMessage('Cantidad inválida.'),
    body('Precio').notEmpty().withMessage('El precio es obligatorio.').isFloat({ min: 0 }).withMessage('Precio inválido.'),
    body('Imagen').optional({ checkFalsy: true }).trim().escape(),
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('/admin/libros/editar/' + req.params.id);
        }
        try {
            const { id } = req.params;
            const { Nombre, Categoria, Autor, Editorial, Anio, Cantidad, Precio, Imagen } = req.body;
            const libro = { Nombre, Categoria, Autor, Editorial, Anio, Cantidad, Precio, Imagen };
            await adminModel.actualizarLibro(libro, id);
            req.flash('exito', 'Libro actualizado correctamente.');
            res.redirect('/admin/libros');
        } catch (error) {
            req.flash('error', 'Error al actualizar el libro.');
            res.redirect('/admin/libros/editar/' + req.params.id);
        }
    }
];

adminController.actualizarEditorial = [
    body('Nombre').notEmpty().withMessage('El nombre es obligatorio.').trim().escape(),
    body('id').notEmpty().withMessage('El ID es obligatorio.').isInt().withMessage('ID inválido.'),
    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            req.flash('error', errors.array().map(e => e.msg).join(', '));
            return res.redirect('/admin');
        }
        try {
            const { Nombre, id } = req.body;
            await adminModel.actualizarEditorial(Nombre, id);
            req.flash('exito', 'Editorial actualizada correctamente');
            res.redirect('/admin');
        } catch (error) {
            req.flash('error', 'Ocurrió un error al actualizar');
            res.redirect('/admin');
        }
    }
];

module.exports = adminController;