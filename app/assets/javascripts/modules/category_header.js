$(function(){
  function buildHTML(data){
    var html = $("<ul>").addClass("Headfield__Bottom__left__category__field--menu")
    var link
    data.forEach(function(value){
      link = $("<a>", {
        href: "/api/categories/" + value.id ,
        "class":"category_name no-underline"
      }).text(value.name)
      link = $("<li>").append(link)
      html.append(link)
    })
    return html
  }

  $("#catroy_top_title").mouseenter(function(){
    $(".Headfield__Bottom__left__category__field--menu").remove()
  })

  $(".Headfield__Bottom__left__category").mouseleave(function(){
    $(".Headfield__Bottom__left__category__field--menu").remove()
  })

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
      .done(function(result){
        if( result.length != 0 ){
          var html = buildHTML(result)
          $(this).parent().parent().nextAll(".Headfield__Bottom__left__category__field--menu").remove()
          $(".Headfield__Bottom__left__category__field").append(html)
        } 
      })

      $(".Headfield__Bottom__left__category__field--menu").mouseenter(function(eo){ 
        $(this).find("*").css("color","")
      })
    },'mouseleave' : function(){
      $(".Headfield__Bottom__left__category__field--menu").mouseleave(function(eo){
        $(eo.fromElement).find("*").css("color","orange")
      })
    }
  }, ".category_name")

  $('#brand_top_title').hover(function(){
      $('ul:not(:animated)', this).slideDown(300);
    },
    function(){
      $('ul',this).hide();
  });
})
