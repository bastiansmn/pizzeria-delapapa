module.exports = {
   user: process.env.DB_USER || 'root',
   host: process.env.DB_HOST || 'localhost',
   database: process.env.DB_NAME || 'pizzeria-delapapa',
   password: process.env.DB_PASSWORD || '',
   port: process.env.DB_PORT || 5432
}