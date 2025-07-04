module.exports = {
    database: {
        host: process.env.MYSQL_HOST || 'localhost',
        user: process.env.MYSQL_USER || 'root',
        password: process.env.MYSQL_PASSWORD || 'password',
        database: process.env.MYSQL_DATABASE || 'libreria',
        port: process.env.MYSQL_PORT || 6603,
        multipleStatements: true
    }
}

