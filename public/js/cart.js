class Cart {
   #cart;
   #target;

   showCart = false;

   constructor(target) {
      this.#cart = [];
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
            headers: {
               "Content-Type": "application/json"
            },
            body: JSON.stringify({
               items: [
                  {
                     item_id: 1,
                     name: "Salade Caesar",
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
                  },
                  {
                     item_id: 3,
                     name: "Orangina",
                     image: "https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/orangina-regular.4ba0ed03af7fad9fb7207d249a3d8128.1.jpg",
                     quant: 1,
                     price: 2,
                  }
               ]
            })
         })
            .then(res => res.text())
            .then(res => {
               resolve(res);
            })
      })
   }

}
