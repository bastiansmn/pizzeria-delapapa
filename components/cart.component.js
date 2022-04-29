module.exports = (app, db) => {
   app.put("/components/cart", (req, res) => {
      console.log(req.body);
      const items = [
         {
            item_id: 1,
            name: "Salade César",
            image: "https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/salade-caesar.3774efa52bbe1f08d63ae78a0f672b11.1.jpg",
            quant: 1,
            price: 6,
         },
         {
            item_id: 2,
            name: "Pizza 6 fromages",
            image: "https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/fromage.e70b59d7921e1113513460fbea3046df.1.jpg",
            quant: 2,
            price: 12,
         }
      ];
      res.render("components/cart", {
         items,
         total: 30
      });
   });
}