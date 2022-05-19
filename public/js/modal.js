class Modal {
   
   show(title, htmlContent, footer) {
      $('.modal-title').html(title);
      $('.modal-body').html(htmlContent);
      $('.modal-footer > button').html(footer);
      $('#staticBackdrop').modal('show');
   }

}