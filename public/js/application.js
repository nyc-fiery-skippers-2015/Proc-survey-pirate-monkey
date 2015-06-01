$(document).ready(function() {
  $('.submit-form').on('submit',submitForms);
});


var submitForms = function(event) {
  event.preventDefault();
  $('.survey-form').each(function(){
    self = $(this)
    $.ajax({
       method: 'put',
       url: this.action,
       data: self.serialize()
    }).done(function(response){
      console.log(response);
    }).fail(function(error){
      console.log(error);
   });
 });
 window.location.replace('/surveys');
};
