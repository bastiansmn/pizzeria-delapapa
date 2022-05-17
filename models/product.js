module.exports.ProductType = class ProductType {
   static PIZZA = 0;
   static STARER = 1;
   static DRINK = 2;
}

module.exports.PizzaSize = class PizzaSize {
   static S = "S";
   static M = "M";
   static XL = "XL";
}

module.exports.DrinkSize = class DrinkSize {
   static _25cl = "25cl";
   static _33cl = "33cl";
   static _50cl = "50cl";
   static _1l = "1l";
}

const Product = class Product {

   constructor(name, price, image, is_veggie=false, is_spicy=false, description) {
      this.name = name;
      this.price = price;
      this.image = image;
      this.is_veggie = is_veggie;
      this.is_spicy = is_spicy;
      this.description = description;
   }

}

module.exports.Product = Product;

module.exports.Pizza = class Pizza extends Product {

   constructor(name, price, image, is_veggie=false, is_spicy=false, description, is_custom, pizza_size) {
      super(name, price, image, is_veggie, is_spicy, description);
      this.is_custom = is_custom;
      this.pizza_size = pizza_size;
   }

}

module.exports.Starter = class Starter extends Product {
   
   constructor(name, price, image, is_veggie=false, is_spicy=false, description, sauce) {
      super(name, price, image, is_veggie, is_spicy, description);
      this.sauce = sauce;
   }

}

module.exports.Drink = class Drink extends Product {

   constructor(name, price, image, is_veggie=false, is_spicy=false, description, drink_size) {
      super(name, price, image, is_veggie, is_spicy, description);
      this.drink_size = drink_size;
   }

}
