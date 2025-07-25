const express = require('express');
const router = express.Router();
const pool = require('../db');
const helper = require("../lib/helpers");
var adminController = require('../controllers/adminController');
router.get("/admin", helper.hasRole('admin'), adminController.inicio);
router.get("/admin/libro", helper.hasRole('admin'), adminController.libro);
router.post("/admin/libro", helper.hasRole('admin'), adminController.agregarLibro);
router.get("/admin/remates", helper.hasRole('admin'), adminController.remates);
router.post("/admin/remates", helper.hasRole('admin'), adminController.agregarRemate);
router.get("/admin/tec", helper.hasRole('admin'), adminController.tec);
router.post("/admin/tec", helper.hasRole('admin'), adminController.agregarTec);
router.get("/admin/editorial", helper.hasRole('admin'), adminController.editoriales);
router.post("/admin/editorial", helper.hasRole('admin'), adminController.agregarEditorial);
router.get("/admin/categoria", helper.hasRole('admin'), adminController.categorias);
router.post("/admin/categoria", helper.hasRole('admin'), adminController.agregarCategoria);
router.get("/admin/autor", helper.hasRole('admin'), adminController.autores);
router.post("/admin/autor", helper.hasRole('admin'), adminController.agregarAutor);
router.post("/admin/eliminar_categoria", helper.hasRole('admin'), adminController.eliminarCategoria);
router.post("/admin/eliminar_editorial", helper.hasRole('admin'), adminController.eliminarEditorial);
router.post("/admin/eliminar_autor", helper.hasRole('admin'), adminController.eliminarAutor);
router.post("/admin/actualizar_categoria", helper.hasRole('admin'), adminController.actualizarCategoria);
router.post("/admin/actualizar_editorial", helper.hasRole('admin'), adminController.actualizarEditorial);
router.post('/autor/update/:id', adminController.actualizarAutor);

router.get('/admin/libros', helper.hasRole('admin'), adminController.libros);
router.get('/admin/libros/eliminar/:id', helper.hasRole('admin'), adminController.eliminarLibro);
router.get('/admin/libros/editar/:id', helper.hasRole('admin'), adminController.editarLibro);
router.post('/admin/libros/editar/:id', helper.hasRole('admin'), adminController.actualizarLibro);

module.exports = router;