class Mypage::CardsController < ApplicationController
  before_action :authenticate_user!
  require "payjp"
  
  def index
    card = current_user.cards[0]
    Payjp.api_key = Rails.application.credentials[:payjp][:ACCESS_KEY]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @customer_card = customer.cards.retrieve(card.card_id)
    
  end

  def new
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:ACCESS_KEY]
    if params["payjp_token"].blank?
      redirect_to action: "new", alert: "クレジットカードを登録できませんでした。"
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to mypage_cards_path
      else
        redirect_to new_mypage_card_path
      end
    end
  end

  def destroy
    
  end
end
