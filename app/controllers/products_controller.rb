class ProductsController < ApplicationController
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
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :new
    end
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
                                      :image,
                                      :_destroy
                                    ])
  end
end
