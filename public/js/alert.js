class AlertType {
   static SUCCESS = 'success';
   static INFO = 'info';
   static WARNING = 'warning';
   static DANGER = 'danger';
}

class Alert {

   timeout;

   constructor(option={ duration: 3000 }) {
      this.option = option;
   }

   show(textContent, type) {
      const alert = $("#alert");
      clearTimeout(this.timeout);
      alert.text(textContent);
      alert.removeClass();
      alert.addClass(["pe-none", "position-fixed", "bottom-0", "start-50", "translate-middle-x", "alert", "fade", "show", "alert-" + type]);
      alert.attr("role", "alert");
      this.timeout = setTimeout(() => {
         alert.removeClass("show");
      }, this.option.duration);
   }

   persist(textContent, type) {
      const alert = $("#alert");
      alert.text(textContent);
      alert.append("<button type='button' role='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>\n");
      alert.removeClass();
      alert.addClass(["position-fixed", "bottom-0", "start-50", "translate-middle-x", "alert", "fade", "show", "alert-" + type, "alert-dismissible"]);
      alert.attr("role", "alert");
   }

}