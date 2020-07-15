$(function(){
  function buildHTML(count) {
    var html = `<div class="preview-box" id="preview-box__${count}">
                  <div class="upper-box">
                    <img src="" alt="preview">
                  </div>
                  <div class="lower-box">
                    <label class="update-box" id="label-box--${count}" for="product_images_attributes_${count}_image">
                      <span>編集</span>
                    </label>
                    <div class="delete-box" id="delete_btn_${count}">
                      <span>削除</span>
                    </div>
                  </div>
                </div>`
    return html;
  }

  // #NEWアクションjs
  if (window.location.href.match(/\/products\/\d+\/edit/)){
    var prevContent = $('.label-content').prev();
    labelWidth = (550 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label-content').css('width', labelWidth);
    $('.preview-box').each(function(index, box){
      $(box).attr('id', `preview-box__${index}`);
    })
    $('.delete-box').each(function(index, box){
      $(box).attr('id', `delete_btn_${index}`);
    })
    var count = $('.preview-box').length;
    if (count == 5) {
      $('.label-content').hide();
    }
  }
  function setLabel() {
    var prevContent = $('.label-content').prev();
    labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label-content').css('width', labelWidth);
  }

  // #画像プレビュー表示
  $(document).on('change', '.hidden-field', function() {
    setLabel();
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    $('.label-box').attr({id: `label-box--${id}`,for: `product_images_attributes_${id}_image`});
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
      var image = this.result;
      if ($(`#preview-box__${id}`).length == 0) {
        var count = $('.preview-box').length;
        var html = buildHTML(id);
        var prevContent = $('.label-content').prev();
        $(prevContent).append(html);
      }
      $(`#preview-box__${id} img`).attr('src', `${image}`);
      var count = $('.preview-box').length;
      if (count == 5) { 
        $('.label-content').hide();
      }
      if ($(`#product_images_attributes_${id}__destroy`)){
        $(`#product_images_attributes_${id}__destroy`).prop('checked',false);
      } 

      setLabel();
      if(count < 5){
        $('.label-box').attr({id: `label-box--${count}`,for: `product_images_attributes_${count}_image`});
      }
    }
  });

  // #画像の削除
  $(document).on('click', '.delete-box', function() {
    var count = $('.preview-box').length;
    setLabel(count);
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    $(`#preview-box__${id}`).remove();

    // #NEWアクション、#EDITアクション条件分岐=============
    // #NEWアクション
    if ($(`#product_images_attributes_${id}__destroy`).length == 0) {
      $(`#product_images_attributes_${id}_image`).val("");
      var count = $('.preview-box').length;
      if (count == 4) {
        $('.label-content').show();
      }
      setLabel(count);
      if(id < 5){
        $('.label-box').attr({id: `label-box--${id}`,for: `product_images_attributes_${id}_image`});
      }
    } else {
      // #EDITアクション
      $(`#product_images_attributes_${id}__destroy`).prop('checked',true);
      if (count == 4) {
        $('.label-content').show();
      }

      setLabel();
      if(id < 5){
        $('.label-box').attr({id: `label-box--${id}`,for: `product_images_attributes_${id}_image`});
      }
    }
  });
});
