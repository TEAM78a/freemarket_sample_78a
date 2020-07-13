$(function(){
  Payjp.setPublicKey('Rails.application.credentials[:payjp][:PUBLIC_KEY]');
    
    $('#token_submit').click(function(e){
    // console.log('Rails.application.credentials[:payjp][:PUBLIC_KEY]');
    e.preventDefault();

    let card = {
        number: document.getElementById("payment_card_no").value,
        cvc: document.getElementById("payment_card_cvc").value,
        exp_month: document.getElementById("payment_card_month").value,
        exp_year: document.getElementById("payment_card_year").value
    };

    console.log(card);
  });
});