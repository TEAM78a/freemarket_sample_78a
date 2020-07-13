$(function(){
  Payjp.setPublicKey('pk_test_90588d9619d4cd0ae1005186');
    
    $('#token_submit').click(function(e){
    e.preventDefault();

    let card = {
        number: $('#payment_card_no').val(),
        cvc: $('#payment_card_cvc').val(),
        exp_month: $('#payment_card_month').val(),
        exp_year: $('#payment_card_year').val()
    };
    console.log(card);
    Payjp.createToken(card, function(status, response) {
      if (status === 200) {
        $('#payment_card_no').removeAttr("name");
        $('#payment_card_cvc').removeAttr("name");
        $('#payment_card_month').removeAttr("name");
        $('#payment_card_year').removeAttr("name"); 
        $('#card_token').append(
          $('<input type="hidden" name="payjp_token">').val(response.id)
        );
        document.inputForm.submit();
        // alert("登録が完了しました");
      } else {
        // redirect_to new_mypage_card_path
        // alert("カード情報が正しくありません。");
      }
    });
  });
});