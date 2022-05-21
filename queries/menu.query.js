module.exports = {
   getPizzas: "SELECT * FROM product WHERE type=0 AND is_custom=false",
   getDrinks: "SELECT * FROM product WHERE type=2",
   getStarters: "SELECT * FROM product WHERE type=1",
   getMenus: "SELECT * FROM menus",
   getSauces: "SELECT * FROM sauce ORDER BY name",

   createCustomPizza: (pizza) => `INSERT INTO product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (DEFAULT, '${pizza.name}', ${pizza.price}, null, 0, true, DEFAULT, DEFAULT, '${pizza.description}')`,
}