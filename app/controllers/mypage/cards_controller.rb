class Mypage::CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_key, only:[:index, :create, :destroy]
  before_action :set_cards, only:[:index, :update]
  before_action :set_card, only:[:update, :destroy]
  
  def index
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
      if !current_user.cards.blank?
        @card.default_flg = 0
      end

      if @card.save
        redirect_to mypage_cards_path
      else
        redirect_to new_mypage_card_path
      end
    end
  end

  def update
    card = @cards.find_by(default_flg: 1)
    card.default_flg = 0
    @card.default_flg = 1
    if card.save && @card.save
      redirect_to mypage_cards_path
    else
      render :index
    end
  end

  def destroy
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.default_flg
      @card.delete
      card= current_user.cards[0]
      card.default_flg = 1
      card.save
    else
      @card.delete
    end
    redirect_to mypage_cards_path
  end

  private
  def set_api_key
    Payjp.api_key = Rails.application.credentials[:payjp][:ACCESS_KEY]
  end

  def set_cards
    @cards= current_user.cards
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
