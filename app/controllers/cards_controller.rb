class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_key, only:[:index]
  before_action :set_cards
  before_action :set_card, only:[:update]

  def index
    @product_id = params[:id]
  end

  def update
    card = @cards.find_by(default_flg: 1)
    card.default_flg = 0
    @card.default_flg = 1
    if card.save && @card.save
      redirect_to purchase_products_path(params[:product_id])
    else
      render :index
    end
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
