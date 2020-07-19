class Api::CategoriesController < ApplicationController
  def show
    if params[:id] == "0"
      @categories = Kind.where(ancestry:nil)
    else
      @categories = Kind.find(params[:id]).children
    end

    respond_to do |format|
      format.html{
        if params[:id] == "0"
          redirect_to products_path
        else
          search_params = Kind.find(params[:id]).children.ids
          Kind.find(params[:id]).children.ids.each do |children|
            Kind.find(children).children.ids.each do |grand|
              search_params << grand
            end
          end
          search_params << params[:id].to_i
          redirect_to products_path({q: {"kind_id_in": search_params, commit: "Search" }})
        end
      }
      format.json{
        render json: @categories
      }
    end 
  end
end
