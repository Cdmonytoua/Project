module.exports = {
    database: {
        host: process.env.MYSQL_HOST || '172.17.0.2',
        user: process.env.MYSQL_USER || 'root',
        password: process.env.MYSQL_PASSWORD || 'password',
        database: process.env.MYSQL_DATABASE || 'libreria',
        multipleStatements: true
    }
}

