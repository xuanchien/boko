// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $("input[data-price]").priceFormat({
    prefix: '',
    centsLimit: -1,
    thounsandSeparator: ',',
    centsSeparator: ''
  })
  
  //convert number into string
  $("#advert_original_price").keyup(function(){
    var number = $(this).unmask();
    $("#price-string").text(DocTienBangChu(number));
  })
  
  $("form.new_bid").bind('ajax:success', function(e, data, xhr, status){
    var modal = $(this).closest(".reveal-modal");
    modal.find(".close-reveal-modal").trigger("click");
    
    //find the window
  }) 
  
  if ($(".pagination").length){
    $(window).scroll(function(){
      var url = $(".pagination .next_page").attr("href");
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50){
        $(".pagination").text("");
        $(".pagination").showLoading();
        $.getScript(url);
      }
    })
    
    $(window).scroll();
  }
})
