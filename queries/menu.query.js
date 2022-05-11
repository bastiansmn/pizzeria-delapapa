module.exports = {
   getProducts: "SELECT * FROM product WHERE is_custom = false",
   getMenus: "SELECT * FROM menus m",
   getProductsInMenu: (menu_id) => `SELECT * FROM link_menu_product WHERE menu_id=${menu_id}`
}