$("#").change(function () {
  let parentValue = $("#").val();
  if (parentValue.length != 0) {
    $.ajax({
      url: '/posts/search',
      type: 'GET',
      data: { parent_id: parentValue },
      dataType: 'json'
    })
      .done(function (data) {
      })
      .fail(function () {
      });
  }
});