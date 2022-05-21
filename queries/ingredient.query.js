module.exports = {
   getTypes: "SELECT DISTINCT ingr_type FROM ingredients ORDER BY ingr_type ASC",
   getIngredientsOfType: (type) => `SELECT * FROM ingredients WHERE ingr_type='${type}'`,
}