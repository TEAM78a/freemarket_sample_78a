class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only:[:edit, :update, :show]
  before_action :edit_validate, only: [:edit]
  before_action :set_parents, only: [:new, :create]

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
    @products_kind = Product.where(kind_id: @product.kind_id).limit(3)
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :new
    end
  end

  def destroy
  end

  def set_parents
    @parents = Kind.where(ancestry: nil)
  end

  def search
    respond_to do |format|
      format.html
      format.json do
        # if params[:parent_id]
        @childrens = Kind.find(params[:parent_id]).children
        # elsif params[:children_id]
          # @grandChilds = Kind.find(params[:children_id]).children
      end
    end
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
