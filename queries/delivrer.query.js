module.exports = {
    getLastPendingOrders: `SELECT o.id, o.status, o.date, a.name_adr, a.opt_info FROM "order" o, address a WHERE o.address_id=a.id AND o.status='PENDING' ORDER BY o.date`,
}