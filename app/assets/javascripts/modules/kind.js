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
    // 初期値0("選択してください")以外を選択したらajax開始
    if (parentValue.length != 0) {
      $.ajax({
        url: '/products/search',
        type: 'GET',
        data: { parent_id: parentValue },
        dataType: 'json'
      })
        .done(function (data) {
          // 既に子カテゴリがある場合は削除
          $(".child_kind").remove();
          // 既に孫カテゴリがある場合は孫カテゴリも削除
          $(".grandchild_kind").remove();
          // build_childSelectを実行し selectタグを生成してビューにappend
          let child_select = build_childSelect();
          // jbuilderから取得したデータを1件ずつoptionタグにappend
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
  // 子カテゴリを変更するとjQueryが発火
  $(document).on("change", ".child_kind", function () {
    function build_grandchildSelect() {
      let grandchild_select = `
                <select name="product[kind_id]" class="grandchild_category" required="required">
                  <option value=""> 選択してください </option>
                </select>
                `
      return grandchild_select;
    }
    // selectタグにoptionタグを追加
    function build_Option(grandchild) {
      console.log(grandchild)
      let option_html = `
                        <option value=${grandchild.id}>${grandchild.name}</option>
                        `
      return option_html;
  }

    // 選択したoption(子カテゴリの値)を取得しparentValueに格納
    let childValue = $(".child_kind").val();
    // 初期値0("選択してください")以外を選択したらajax開始
    if (childValue.length != 0) {
      $.ajax({
        url: '/products/search',
        type: 'GET',
        // productsコントローラーに paramsをchildren_id で送る
        data: { children_id: childValue },
        dataType: 'json'
      })

        .done(function (data) {
          console.log(data)
          // 既に孫カテゴリがある場合は削除
          $(".grandchild_category").remove();
          // build_grandchildSelectを実行し selectタグを生成してビューにappend
          let grandchild_select = build_grandchildSelect
          $("#grandchild_category_field").append(grandchild_select);
          // jbuilderから取得したデータを1件ずつoptionタグにappend
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