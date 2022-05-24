module.exports = {
   getUsers: "SELECT * FROM users",

   createAddress: (user_id, name_adr, opt="") => `INSERT INTO address (name_adr, opt_info, user_id) VALUES ('${name_adr}', '${opt}', ${user_id}) RETURNING *`,
   getAdressOfuser: (user_id) => `SELECT * FROM address WHERE user_id = ${user_id}`,
}