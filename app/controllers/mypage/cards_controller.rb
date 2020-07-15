class Mypage::CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_key, only:[:index, :create, :destroy]
  
  def index
    @card = current_user.cards[0]
    if !@card.blank?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = customer.cards.retrieve(@card.card_id)
      @card_brand = @customer_card.brand
      case @card_brand
      when "Visa"
        @card_src = "cards/visa.svg"
      when "JCB"
        @card_src = "cards/jcb.svg"
      when "MasterCard"
        @card_src = "cards/master-card.svg"
      when "American Express"
        @card_src = "cards/american_express.svg"
      when "Diners Club"
        @card_src = "cards/dinersclub.svg"
      when "Discover"
        @card_src = "cards/discover.svg"
      end
    end
  end

  def new
  end

  def create
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
    @card = Card.find(params[:id])
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.delete
    redirect_to mypage_cards_path
  end

  private
  def set_api_key
    Payjp.api_key = Rails.application.credentials[:payjp][:ACCESS_KEY]
  end
end
