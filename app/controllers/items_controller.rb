class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :logout]

  def index
    @products = Product.where.not(sold_out_flg: 2).order("created_at DESC").limit(4)
    @products_random = Product.where.not(sold_out_flg: 2).order("RAND()").limit(4)
  end

  def mypage
  end

  def logout
  end
end
