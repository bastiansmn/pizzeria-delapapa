class Cart {
   #cart;
   #target;

   showCart = false;

   constructor(target) {
      this.#cart = [];
      this.#target = target;
      // Add cart style
      $(`${target}`).on("click", async event => {
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
      })
   }

   addToCart = (item) => {
      this.#cart.push(item);
   }

   removeItem = (item) => {
      this.#cart = this.#cart.filter(i => {
         return i.id !== item.id;
      });
   }

   cartSize = () => {
      return this.#cart.length;
   }

   update = () => {
      // Update component (display items in cart in needed, and repaint icon with cartSize)
   }

   renderComponent = () => {
      return new Promise(resolve => {
         fetch("/components/cart", {
            method: "PUT",
            body: {
               items: [
                  {
                     item_id: 1,
                     name: "Salade",
                     price: 6,
                  },
                  {
                     item_id: 2,
                     name: "Pizza 6 fromages",
                     price: 12
                  }
               ]
            }
         })
            .then(res => res.text())
            .then(res => {
               resolve(res);
            })
      })
   }

}
