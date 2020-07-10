$(function() {
  $('.lists img').click(function(){
    var ImgSrc = $(this).attr('src');
    $('#main-img').get(0).src = ImgSrc;
    return false;
  });
});