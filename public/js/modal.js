class Modal {
   
   show(title, htmlContent) {
      $('.modal-title').html(title);
      $('.modal-body').html(htmlContent);
      $('#staticBackdrop').modal('show');
   }

   close() {
      $('#staticBackdrop').modal('hide');
   }

}