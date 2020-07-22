class Mypage::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @favorite = current_user.favorites
  end
end
