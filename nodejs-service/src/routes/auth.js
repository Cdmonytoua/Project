const express = require('express');
const router = express.Router();
const pool = require('../db');
const passport = require('passport');
const helper = require("../lib/helpers");
router.get("/registrar", helper.isnotLogged, (req, res) => {
    res.render("registrar", { style: "registrar.css" });
});
router.get("/micuenta", helper.isLogged, async (req, res) => {
    const user = req.user;
    res.render("micuenta", { style: "registrar.css", user });
});
router.post("/micuenta/actualizar", async (req, res) => {
    try {
        const { CodigoPostal, Nombre, Direccion, Correo, ApellidoM, ApellidoP } = req.body;
        const sql = "UPDATE clientes SET CodigoPostal = ?, Nombre = ?, Direccion = ?, Correo = ?, ApellidoM = ?, ApellidoP = ? WHERE id = ?";
        const params = [CodigoPostal, Nombre, Direccion, Correo, ApellidoM, ApellidoP, req.user.id];
        await pool.query(sql, params);
        req.flash('exito', 'Datos actualizados correctamente');
    } catch (error) {
        req.flash('error', 'Ocurrió un error al actualizar los datos');
    }
    res.redirect("/micuenta");
});
router.get("/salir", helper.isLogged, (req, res) => {
    req.logout(function (err) {
        if (err) { return next(err); }
        res.redirect('/');
    });
});
router.post("/registrar", passport.authenticate('local.registrar', {
    successRedirect: '/',
    failureRedirect: '/registrar',
    failureFlash: true
}));
router.post("/login", (req, res, next) => {
    passport.authenticate('local.iniciar', (err, user, info) => {
        if (err) { return next(err); }
        if (!user) {
            req.flash('error', info.message);
            return res.redirect('/login');
        }
        req.logIn(user, (err) => {
            if (err) { return next(err); }
            const returnTo = req.session.returnTo || '/';
            delete req.session.returnTo;
            return res.redirect(returnTo);
        });
    })(req, res, next);
});
router.get('/login/github', passport.authenticate('github', { scope: ['user:email'] }));
router.get('/login/github/callback', passport.authenticate('github', { failureRedirect: '/login', failureFlash: true }),
    function (req, res) {
        res.redirect('/');
    }
);
router.get('/login/facebook', passport.authenticate('facebook', { scope: ["public_profile", "email"], }));

router.get('/login/facebook/callback',
    passport.authenticate('facebook', {
        successRedirect: '/',
        failureRedirect: '/login',
        failureFlash: true
    }));
router.get("/login", helper.isnotLogged, (req, res) => {
    res.render("auth", { layout: false });
});
module.exports = router;