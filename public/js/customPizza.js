class PizzaCustomization {
   // Centimes par ingrédients
   static INGR_PRICE = 50;
   static BASE_PRICE = 1600;

   constructor() {
      this.ingredients = [];
      this.currentPrice = PizzaCustomization.BASE_PRICE;
   }

   addIngredient(ingr_id) {
      this.ingredients.push(ingr_id);
   }

   deleteIngredient(ingr_id) {
      this.ingredients = this.ingredients.filter(ingr => ingr !== ingr_id);
   }

   getBasePrice(coefficient) {
      return PizzaCustomization.BASE_PRICE * coefficient;
   }

   getIngrPrice() {
      return PizzaCustomization.INGR_PRICE * this.ingredients.length;
   }
}
