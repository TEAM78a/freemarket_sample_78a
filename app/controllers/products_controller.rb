class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    # @product.images.new
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    binding.pry
    if @product.save
      # binding.pry
      redirect_to root_path
    else
      # binding.pry
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
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
                                      :product_id,
                                      :image,
                                      :_destroy
                                    ])
  end
end
