module.exports = {
    getByID: (id) => `SELECT * FROM order WHERE id=${id}`,
 }