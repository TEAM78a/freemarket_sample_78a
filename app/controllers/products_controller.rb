class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only:[:show, :edit, :update, :destroy, :purchase, :pay]
  before_action :edit_validate, only: [:edit]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
  end

  def purchase
    Payjp.api_key = Rails.application.credentials[:payjp][:ACCESS_KEY]
    @card = current_user.cards[0]
    if !@card.blank?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = customer.cards.retrieve(@card.card_id)
    end
  end
  
  def pay
    @card = current_user.cards[0]
    if @card.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      # card = current_user.credit_card
      Payjp.api_key = Rails.application.credentials[:payjp][:ACCESS_KEY]
      if charge = Payjp::Charge.create(
        amount: @product.price,
        customer: @card.customer_id,
        currency: 'jpy',
        )
        
        @product.sold_out_flg = 1
        @product.save
        redirect_to done_products_path
      else
        render :purchase
      end
    end
  end

  def done
  end

  private

  def product_params
    params.require(:product).permit(:name,
                                    :introduce,
                                    :price,
                                    :kind_id,
                                    :brand_id,
                                    :condition_id,
                                    :postage_id,
                                    :shipment_id,
                                    :prefecture_id,
                                    images_attributes: [
                                      :id,
                                      :image,
                                      :_destroy
                                    ]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def edit_validate
    if @product.user_id != current_user.id
      redirect_to root_path
    end
  end
end
