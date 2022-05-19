class Item {
   constructor(item_id, name, image, price, displayedPrice, type, opt="") {
      this.item_id = item_id;
      this.name = name;
      this.image = image;
      this.price = price;
      this.displayedPrice = displayedPrice;
      this.type = type;
      this.quantity = 1;
      this.opt = opt;
   }
}

class Cart {
   #cart;
   #target;

   showCart = false;

   constructor(target) {
      // Load session storage
      if (sessionStorage.getItem('cart')) {
         this.#cart = JSON.parse(sessionStorage.getItem('cart'));
         this.update();
      } else {
         this.#cart = [];
      }
      this.#target = target;
      
      // Toggle cart and render component
      $(target).on("click", async event => {
         event.stopPropagation();
         let temp = event.target;
         while (!temp.classList.contains("cart__content") && !temp.classList.contains("cart__infos")) {
            temp = temp.parentElement;
         }
         if (temp.classList.contains("cart__infos")) {
            if (this.showCart)
               $(".cart__content").html("")
            else 
               $(".cart__content").html($(await this.renderComponent()))
            this.showCart = !this.showCart;
         }
      });

      $(window).on("click", () => {
         this.showCart = false;
         $(".cart__content").html("");
      });
   }

   addToCart = (item) => {
      const existingItem = this.#cart.find(i => i.item_id === item.item_id);
      if (!existingItem)
         this.#cart.push(item);
      else 
         existingItem.quantity++;
      this.update();
      window.alert.show(`${item.name} ajouté au panier`, AlertType.SUCCESS);
   }

   removeItem = (item_id) => {
      const item = this.#cart.find(i => i.item_id === item_id);
      this.#cart = this.#cart.filter(i => {
         return i.item_id !== item_id;
      });
      window.alert.show(`${item.name} supprimé du panier`, AlertType.DANGER);
      this.update();
   }

   cartSize = () => {
      return this.#cart.reduce((acc, item) => {
         return acc + item.quantity;
      }, 0);
   }

   update = async () => {
      // Update component (display items in cart if needed, and repaint icon with cartSize)
      sessionStorage.setItem("cart", JSON.stringify(this.#cart));
      if (this.showCart)
         $(".cart__content").html($(await this.renderComponent()));
      $(".cart__size").html(this.cartSize());
   }

   renderComponent = () => {
      return new Promise(resolve => {
         fetch("/components/cart", {
            method: "PUT",
            headers: {
               "Content-Type": "application/json"
            },
            body: JSON.stringify({
               items: this.#cart
            })
         })
            .then(res => res.text())
            .then(res => {
               resolve(res);
            })
      })
   }

}
