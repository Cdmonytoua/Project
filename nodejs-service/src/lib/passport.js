const passport = require('passport');
const strategy = require('passport-local').Strategy;
const pool = require('../db');
const helper = require('../lib/helpers');
const FacebookStrategy = require('passport-facebook').Strategy;
const GitHubStrategy = require('passport-github2').Strategy;
const config = require('../config');
passport.use('local.iniciar', new strategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async (req, username, password, done) => {
    const [rows] = await pool.query('SELECT * FROM clientes WHERE Username = ?', [username]);
    if (rows.length > 0) {
        const user = rows[0];
        const flag = await helper.matchPassword(password, user.Password);
        if (flag) {
            done(null, user);
        } else done(null, false, req.flash('error', "Contraseña incorrecta"));
    } else return done(null, false, req.flash('error', 'No existe el nombre de usuario'));
}));

passport.use('local.registrar', new strategy({
    usernameField: 'Username',
    passwordField: 'Password',
    passReqToCallback: true
}, async (req, Username, Password, done) => {
    const { Nombre, ApellidoP, ApellidoM, Correo, Direccion, CodigoPostal, confirm_password } = req.body;
    if (Password !== confirm_password) {
        return done(null, false, req.flash('error', 'Las contraseñas no coinciden'));
    }
    let Rol = "usuario";
    let newuser = {
        Username,
        Nombre,
        ApellidoP,
        ApellidoM,
        Correo,
        Password,
        Direccion,
        CodigoPostal,
        Rol
    };
    newuser.Password = await helper.encryptPassword(Password);
    try {
        const [result] = await pool.query("INSERT INTO clientes SET ?", [newuser]);
        newuser.id = result.insertId;
        return done(null, newuser);
    } catch (error) {
        done(null, false, req.flash('error', 'Usuario o correo ya utilizados'));
    }
}));
passport.use(new GitHubStrategy({
    clientID: config.githubAuth.clientID,
    clientSecret: config.githubAuth.clientSecret,
    callbackURL: config.githubAuth.callbackURL,
    scope: ['user:email']
},
    async (accessToken, refreshToken, profile, done) => {
        try {
            const [rows] = await pool.query("SELECT * FROM clientes WHERE Correo = ?", [profile.emails[0].value]);
            if (rows.length === 0) {
                var Nombre = profile.displayName;
                var ApellidoP = '';
                var ApellidoM = '';
                var Correo = profile.emails[0].value;
                var Username = profile.username == null ? "" : profile.username;
                var Direccion = "";
                var Password = "";
                var CodigoPostal = 0;
                var Rol = "usuario";
                let newuser = {
                    Username,
                    Nombre,
                    ApellidoP,
                    ApellidoM,
                    Correo,
                    Password,
                    Direccion,
                    CodigoPostal,
                    Rol,
                };
                const [result] = await pool.query("INSERT INTO clientes SET ?", [newuser]);
                newuser.id = result.insertId;
                done(null, newuser);
            } else {
                done(null, rows[0]);
            }
        } catch (err) {
            if (err.code === 'ER_DUP_ENTRY') {
                return done(null, false, { message: 'Ya existe una cuenta con este correo electrónico o nombre de usuario. Por favor, inicia sesión o usa un método diferente.' });
            }
            done(err);
        }
    }
));
passport.use(new FacebookStrategy({
    clientID: config.facebookAuth.clientID,
    clientSecret: config.facebookAuth.clientSecret,
    callbackURL: config.facebookAuth.callbackURL,
    profileFields: ['id', 'emails', 'name']

}, async (accessToken, refreshToken, profile, done) => {
    try {
        const [rows] = await pool.query("SELECT * FROM clientes WHERE Correo = ?", [profile.emails[0].value]);
        if (rows.length === 0) {
            var Nombre = profile.name.givenName;
            var ApellidoP = profile.name.familyName;
            var ApellidoM = profile.name.middleName == null ? "" : profile.name.middleName;
            var Correo = profile.emails[0].value;
            var Username = profile.username == null ? "" : profile.username;
            var Direccion = "";
            var Password = "";
            var CodigoPostal = 0;
            var Rol = "usuario";
            let newuser = {
                Username,
                Nombre,
                ApellidoP,
                ApellidoM,
                Correo,
                Password,
                Direccion,
                CodigoPostal,
                Rol,
            };
            const [result] = await pool.query("INSERT INTO clientes SET ?", [newuser]);
            newuser.id = result.insertId;
            done(null, newuser);
        } else {
            done(null, rows[0]);
        }
    } catch (err) {
        done(err);
    }
}));
passport.serializeUser((user, done) => {
    done(null, user.id);
});
passport.deserializeUser(async (id, done) => {
    const [rows] = await pool.query("SELECT * FROM clientes WHERE id = ?", [id]);
    done(null, rows[0]);
});
