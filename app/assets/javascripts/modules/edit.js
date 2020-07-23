$(function(){
  function appendOption(kind){
    var html = `<option value="${kind.id}" data-kind="${kind.id}">${kind.name}</option>`;
    return html;
  }

  function appendChild(insertHTML) {
    var childSelectHTML = '';
    childSelectHTML = `
                          <select class="main_children" id="child_kind_edit" name="">
                            <option value="---" data-kind="---">---</option>
                            ${insertHTML}
                          </select>
                        `;
    $('.kind-box').append(childSelectHTML);
  }

  function appendGrandChild(insertHTML) {
    var grandChildSelect = '';
    grandChildSelect = `
                          <select class="main_grandchild" id="grandchild_kind_edit" name="product[kind_id]">
                            <option value="---" data-kind="---">---</option>
                            ${insertHTML}
                          </select>
                        `;
    $('.kind-box').append(grandChildSelect);
  }

  $('.kind-box').on('change','#parent_kind_edit', function() {
    $(".main_children").remove()
    $(".main_grandchild").remove()
    var parentValue = document.getElementById('parent_kind_edit').value;
    $.ajax({
      url: '/products/search',
      type: 'GET',
      data: { parent_id: parentValue },
      dataType: 'json'
    })
    .done(function(children){
      $('.main_children').remove();
      $('.main_grandchild').remove();
      var insertHTML = '';
      children.forEach(function(child){
        insertHTML += appendOption(child);
      });
      appendChild(insertHTML);
    })
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
    })
  });


  $('.kind-box').on('change','#child_kind_edit', function(){
    $(".main_grandchild").remove()
    var childValue = document.getElementById('child_kind_edit').value;
    $.ajax({
      url: '/products/search',
      type: 'GET',
      data: { children_id: childValue },
      dataType: 'json'
    })
    .done(function(grandchildren) {
      if (grandchildren.length != 0) {
        $('#grandchild_kind_edit').remove();
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandChild(insertHTML);
      }
    })
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
    })
  })
})