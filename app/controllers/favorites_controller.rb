class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(
                              user_id: current_user.id, 
                              product_id: params[:product_id]
                            )

                            binding.pry

    @favorite.save
    redirect_to mypage_listings_path
    
  end

  def destroy
  end

end
