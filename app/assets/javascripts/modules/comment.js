$(function(){

  function buildHTML(comment){
    var html = `<p></p>
                  ${comment.user_name}
                <strong>
                    ：
                </strong>
                ${comment.text}`
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data){
      var html = buildHTML(data);
      $('.comment-box').append(html);
      $('.comment-box').animate({ scrollTop: $('.comment-box')[0].scrollHeight});
      $('.comment-form')[0].reset();
      $('.comment-form__comment-btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})