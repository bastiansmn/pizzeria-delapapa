module.exports = {
   saveUser: (user) => `INSERT INTO users (id, name, email, lastname, password, phone_num, is_deliverer) VALUES (DEFAULT, '${user.name}', '${user.email}', '${user.lastname}', '${user.password}', '${user.phone_num}', DEFAULT) RETURNING *`,
   getByEmail: (email) => `SELECT * FROM users WHERE email = '${email}'`,
   getByID: (id) => `SELECT * FROM users WHERE id=${id}`,
}