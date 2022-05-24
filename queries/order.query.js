module.exports = {
   createOrder: (addressId) => `INSERT INTO "order" (id, status, date, address_id) VALUES (DEFAULT, 'PENDING', NOW(), ${addressId}) RETURNING *`,
   insertItemToOrder: (order_id, product_id, quant, pizza_size, sauce_name, drink_size) => `INSERT INTO prod_quant (order_id, product_id, quant, pizza_size, sauce_name, drink_size) VALUES (${order_id}, ${product_id}, ${quant}, '${pizza_size}', '${sauce_name}', '${drink_size}') RETURNING *`, 
}