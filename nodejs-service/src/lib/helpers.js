// helpers.txt (helpers.js)

const bcrypt = require('bcryptjs');

const helpers = {};
helpers.encryptPassword = async (password) => {
    const salt = await bcrypt.genSalt(10);
    const encryptedpassword = await bcrypt.hash(password, salt);
    return encryptedpassword;
};
helpers.matchPassword = async (password, encryptedpassword) => {
    try {
        return await bcrypt.compare(password, encryptedpassword);

    } catch (error) {
        console.log(error);
    }
};
helpers.isLogged = (req, res, next) => {
    if (req.isAuthenticated()) {
        return next();
    } else {
        req.session.returnTo = req.originalUrl;
        req.flash('error', 'Necesitas iniciar sesión primero');
        return res.redirect('/login');
    }
};

helpers.hasRole = (...roles) => {
    return (req, res, next) => {
        if (!req.user) {
            return res.redirect('/');
        }
        const userRole = req.user.Rol;
        if (roles.includes(userRole)) {
            return next();
        }
        req.flash('error', 'No tienes permiso para acceder a esta página');
        return res.redirect('/');
    };
};
helpers.isnotLogged = (req, res, next) => {
    if (!req.isAuthenticated()) {
        return next();
    }
    return res.redirect('/');
};
// --- INICIO DE LA MODIFICACIÓN ---
helpers.pagination = async (id, req, res, cantidad, curr_page, callback) => {
    const limit = 24;
    var page = req.query.page;
    if (page == null || page <= 0 || page > cantidad || isNaN(page)) {
        page = 1;
    }
    const offset = (page - 1) * limit;
    const npages = Math.ceil(cantidad / limit);
    let libros;
    if (id == null) {
        libros = await callback(limit, offset);
    } else {
        libros = await callback(id, limit, offset);
    }

    // Lógica para crear la paginación con puntos suspensivos
    const range = 2; // Cantidad de páginas a mostrar alrededor de la página actual
    const pageNum = parseInt(page);
    let pagesToShow = [];
    
    // Generar la lista de páginas a mostrar
    for (let i = 1; i <= npages; i++) {
        // Mostrar siempre la primera, la última y las páginas dentro del rango
        if (i === 1 || i === npages || (i >= pageNum - range && i <= pageNum + range)) {
            pagesToShow.push(i);
        }
    }

    // Crear la estructura final con los puntos suspensivos
    var pages = [];
    let lastPage = 0;
    for (const p of pagesToShow) {
        if (lastPage) {
            // Si hay un salto de más de 1 página, insertar elipsis
            if (p > lastPage + 1) {
                pages.push({ num: '...', isEllipsis: true });
            }
        }
        pages.push({ num: p, isEllipsis: false });
        lastPage = p;
    }

    let prev = parseInt(page) - 1;
    let next = parseInt(page) + 1;
    // La lógica de prev y next no necesita cambiar, pero asegurémonos de que no se vaya de los límites
    if (prev < 1) prev = null;
    if (next > npages) next = null;

    res.render("libros", { style: "libros.css", libros, pages, pag: page, prev, next, curr_page });
};
// --- FIN DE LA MODIFICACIÓN ---
module.exports = helpers;