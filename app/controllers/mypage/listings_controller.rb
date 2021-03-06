class Mypage::ListingsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @products_sale = Product.where(user_id: current_user.id).where(sold_out_flg: 0).order(id: "DESC")
    @products_soldout = Product.where(user_id: current_user.id).where(sold_out_flg: 1).order(id: "DESC")
    @products_finite = Product.where(user_id: current_user.id).where(sold_out_flg: 2).order(id: "DESC")
  end

  def update
    @product = Product.find(params[:id])
    @product.sold_out_flg = 2
    if @product.save
      redirect_to mypage_listings_path
    else
      render :index
    end
  end
end
