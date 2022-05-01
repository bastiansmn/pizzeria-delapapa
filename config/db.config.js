module.exports = {
   user: process.env.DB_USER || 'postgres',
   host: process.env.DB_HOST || 'localhost',
   database: process.env.DB_NAME || 'pizzeria_delapapa',
   password: process.env.DB_PASSWORD || '2001',
   port: process.env.DB_PORT || 5432
}