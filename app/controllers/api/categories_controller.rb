class Api::CategoriesController < ApplicationController
  def show
    @categories = Kind.where(ancestry:nil)

    respond_to do |format|
      format.json{
        render json: @categories
      }
    end 
  end
end
