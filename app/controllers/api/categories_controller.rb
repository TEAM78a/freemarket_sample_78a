class Api::CategoriesController < ApplicationController
  def show
    if params[:id] == "0"
      @categories = Kind.where(ancestry:nil)
    else
      @categories = Kind.find(params[:id]).children
    end

    respond_to do |format|
      format.json{
        render json: @categories
      }
    end 
  end
end
