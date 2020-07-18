$(function() {
  $('#kind_form').change(function() {
    function build_childSelect() {
      let child_select = `
                <select name="" class="child_kind" required="required">
                  <option value=""> 選択してください </option>
                </select>
                `
      return child_select;
    }
    function build_Option(child) {
      let option_html = `
                        <option value=${child.id}>${child.name}</option>
                        `
      return option_html;
    }

    let parentValue = $("#kind_form").val();
    if (parentValue.length != 0) {
      $.ajax({
        url: '/products/search',
        type: 'GET',
        data: { parent_id: parentValue },
        dataType: 'json'
      })
        .done(function (data) {
          $(".child_kind").remove();
          $(".grandchild_kind").remove();
          let child_select = build_childSelect();
          $("#child_category_field").append(child_select);
          data.forEach(function (d) {
            let option_html = build_Option(d)
            $(".child_kind").append(option_html);
          })
        })
        .fail(function () {
          alert("通信エラーです！");
        });
    }
  });
  $(document).on("change", ".child_kind", function () {
    function build_grandchildSelect() {
      let grandchild_select = `
                <select name="product[kind_id]" class="grandchild_category" required="required">
                  <option value=""> 選択してください </option>
                </select>
                `
      return grandchild_select;
    }
    function build_Option(grandchild) {
      console.log(grandchild)
      let option_html = `
                        <option value=${grandchild.id}>${grandchild.name}</option>
                        `
      return option_html;
  }

    let childValue = $(".child_kind").val();
    if (childValue.length != 0) {
      $.ajax({
        url: '/products/search',
        type: 'GET',
        data: { children_id: childValue },
        dataType: 'json'
      })

        .done(function (data) {
          console.log(data)
          $(".grandchild_category").remove();
          let grandchild_select = build_grandchildSelect
          $("#grandchild_category_field").append(grandchild_select);
          data.forEach(function (grandchild) {
            console.log(grandchild)
            let option_html = build_Option(grandchild)
            $(".grandchild_category").append(option_html);
          })
        })
        .fail(function () {
          alert("error:孫カテゴリーの取得に失敗しました");
        });
    }
  });
});