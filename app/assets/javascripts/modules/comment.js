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
    // console.log(this)
    var formData = new FormData(this);
    // console.log(formData)
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
      $('.comment-form__text-form').val('');
      $('.comment-form__comment-btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})