// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("ajax:beforeSend", "form.new_bid", function(){
  var form = $(this);
  var status = form.find(".status");
  status.showLoading({
    'addClass': 'loading-indicator-bars'
  });
})

$(document).on("ajax:success", "form.new_bid", function(e, data, status, xhr){
  var status = $(this).find(".status");
  status.hideLoading();
  if (data.status == 'nok'){  
    if (data.errors.length){
      status.addClass("alert-box alert");
      status.text(data.errors[0]);
    }  
  }
  
})
