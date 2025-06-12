const express = require('express');
const router = express.Router();
const pool = require('../db');
const passport = require('passport');
const helper = require("../lib/helpers");
router.get("/registrar", helper.isnotLogged, (req, res) => {
    res.render("registrar", { style: "registrar.css" });
});
router.get("/micuenta", helper.isLogged, async (req, res) => {
    const users = await pool.query("SELECT * FROM clientes WHERE id = ?", [req.user.id]);
    const user = users[0];
    res.render("micuenta", { style: "registrar.css", user });
});
router.post("/micuenta/actualizar", async (req, res) => {
    var { CodigoPostal, Nombre, Direccion, Correo, ApellidoM, ApellidoP } = req.body;
    const sql = `UPDATE clientes set CodigoPostal = "${CodigoPostal}", Nombre = "${Nombre}", Direccion = "${Direccion}",
    Correo = "${Correo}", ApellidoM = "${ApellidoM}", ApellidoP = "${ApellidoP}" WHERE id = ${req.user.id}`;
    await pool.query(sql, (err, rows) => {
        if (err) req.flash('error', 'Ocurrió un error');
        else req.flash('exito', 'Operación exitosa');
        res.redirect("/micuenta");
    });
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
    passport.authenticate('local.iniciar', {
        successRedirect: '/',
        failureRedirect: '/login',
        failureFlash: true
    })(req, res, next);
});
router.get('/login/github', passport.authenticate('github', { scope: ['user:email'] }));
router.get('/login/github/callback', passport.authenticate('github', { failureRedirect: '/login' }),
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