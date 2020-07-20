class FavoritesController < ApplicationController


  def create
    # binding.pry
    @product = Product.find(params[:product_id])
    @product.like(current_user)
    
                            # (
                            #   user_id: current_user.id, 
                            #   product_id: @product.id
                            # )

    # if @favorite.save
    #   redirect_to mypage_listings_path
    # end
  end

  def destroy
  end

end
