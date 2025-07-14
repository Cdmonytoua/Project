const carritoModel = require('../models/carritoModel');
require('dotenv').config();
const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);

const carritoController = {};

function inicializarCarrito(req) {
    if (!req.session.carrito) {
        req.session.carrito = {};
    }
    if (!req.session.carrito.carrito_libros) {
        req.session.carrito.carrito_libros = {};
    }
    if (!req.session.carrito.carrito_remates) {
        req.session.carrito.carrito_remates = {};
    }
    if (!req.session.carrito.carrito_tecnologia) {
        req.session.carrito.carrito_tecnologia = {};
    }
    return req.session.carrito;
}

function calcularSubtotal(items, carritoItems) {
    return items.reduce((subtotal, item) => {
        const { Id_Libro, Id_Remate, Id_Tecnologia, Precio } = item;
        const id = Id_Libro || Id_Remate || Id_Tecnologia;
        return subtotal + Math.round((carritoItems[id] * Precio) * 100) / 100;
    }, 0);
}

carritoController.carrito = async (req, res) => {
    try {
        const carrito = inicializarCarrito(req);
        const idsLibros = Object.keys(carrito.carrito_libros);
        const idsRemates = Object.keys(carrito.carrito_remates);
        const idsTecnologia = Object.keys(carrito.carrito_tecnologia);

        if (idsLibros.length === 0 && idsRemates.length === 0 && idsTecnologia.length === 0) {
            return res.render("carrito", { style: "carrito.css" });
        }

        const [libros, remates, tecnologia] = await Promise.all([
            carritoModel.carritoLibros(idsLibros),
            carritoModel.carritoRemates(idsRemates),
            carritoModel.carritoTecnologia(idsTecnologia)
        ]);

        const subtotalLibros = calcularSubtotal(libros, carrito.carrito_libros);
        const subtotalRemates = calcularSubtotal(remates, carrito.carrito_remates);
        const subtotalTecnologia = calcularSubtotal(tecnologia, carrito.carrito_tecnologia);

        const total = req.session.total = subtotalLibros + subtotalRemates + subtotalTecnologia;

        res.render('carrito', {
            style: "carrito.css",
            libros,
            remates,
            tecnologia,
            carritoLibros: carrito.carrito_libros,
            carritoRemates: carrito.carrito_remates,
            carritoTecnologia: carrito.carrito_tecnologia,
            total,
            carrito
        });
    } catch (error) {
        req.flash('error', 'Error al cargar el carrito.');
        res.redirect('/');
    }
};

carritoController.limpiar = (req, res) => {
    req.session.carrito = {};
    req.session.total = 0;
    req.flash('exito', 'Carrito vaciado');
    res.redirect('/carrito');
};

function agregarACarrito(req, res, tipo) {
    const carrito = inicializarCarrito(req);
    const id = req.body.id;
    const cantidad = parseInt(req.body.cantidad, 10);
    carrito[tipo][id] = (carrito[tipo][id] || 0) + cantidad;
    req.flash('exito', 'Producto agregado correctamente');
    res.redirect('back');
}

carritoController.agregarLibroACarrito = (req, res) => {
    agregarACarrito(req, res, 'carrito_libros');
};

carritoController.agregarRemateACarrito = (req, res) => {
    agregarACarrito(req, res, 'carrito_remates');
};

carritoController.agregarProductoACarrito = (req, res) => {
    agregarACarrito(req, res, 'carrito_tecnologia');
};

carritoController.compras = (req, res) => {
    const total = req.session.total || 0;
    if (total === 0) {
        req.flash('error', 'No ha agregado productos al carrito de compras');
        return res.redirect('back');
    }
    res.render('compra', { total });
};

carritoController.comprar = async (req, res) => {
    try {
        const stripeToken = req.body.stripeToken;
        const total = req.session.total;
        await stripe.charges.create({
            source: stripeToken,
            currency: 'usd',
            amount: total * 100 // Stripe espera el monto en centavos
        });
        req.session.carrito = {};
        req.session.total = 0;
        req.flash('exito', 'Compra realizada con éxito');
        res.redirect('/carrito');
    } catch (error) {
        req.flash('error', 'Ocurrió un error durante la compra');
        res.redirect("/carrito/comprar");
    }
};

module.exports = carritoController;
