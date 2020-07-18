$(function(){
  $("#category_menu").mouseenter(function(){
    $(".Headfield__Bottom__left__category--field--nav").remove()
  })
  $(".Headfield__Bottom__left__category").mouseleave(function(){
    $(".Headfield__Bottom__left__category--field--nav").remove()
  })
});