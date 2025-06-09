const bcrypt = require('bcryptjs');
const pool = require('./db'); // tu archivo con el pool de conexión

async function insertarUsuarioAdmin() {
  const passwordPlano = 'admin';
  const hash = await bcrypt.hash(passwordPlano, 10); // O usa el hash directamente si quieres que sea idéntico

  const usuario = {
    Username: 'isaigm',
    Nombre: 'admin',
    ApellidoP: 'admin',
    ApellidoM: 'admin',
    Correo: 'dfd@gmail.com',
    Password: hash,
    Direccion: 'ver',
    CodigoPostal: '1233',
    Rol: 'admin',
    id: '881906272636161'
  };

  const query = `
    INSERT INTO clientes 
    (Username, Nombre, ApellidoP, ApellidoM, Correo, Password, Direccion, CodigoPostal, Rol, id) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  try {
    await pool.query(query, [
      usuario.Username,
      usuario.Nombre,
      usuario.ApellidoP,
      usuario.ApellidoM,
      usuario.Correo,
      usuario.Password,
      usuario.Direccion,
      usuario.CodigoPostal,
      usuario.Rol,
      usuario.id
    ]);
    console.log('✅ Usuario admin insertado con éxito.');
  } catch (err) {
    console.error('❌ Error al insertar usuario:', err);
  }
}

insertarUsuarioAdmin();
