$(function(){

  $(document).on({
    'mouseenter' : function() {
      var path = $(this).attr("href");
      $.ajax({
        url: path,
        type: "GET",
        dataType: "json",
        context:this,
        cache: false,
      })
    }
  }) 
})
