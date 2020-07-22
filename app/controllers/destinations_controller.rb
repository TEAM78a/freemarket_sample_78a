class DestinationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_destination
  before_action :edit_validate
  
  def edit
  end

  def update
    if @destination.update(destination_params)
      redirect_to purchase_products_path(params[:product_id])
    else
      render :edit
    end
  end

  private
  def destination_params
    params.require(:send_destination).permit(:family_name,
                                             :first_name,
                                             :family_name_kana,
                                             :first_name_kana,
                                             :postal_code,
                                             :prefectures,
                                             :municipalities,
                                             :address,
                                             :building,
                                             :phone_number
                                             )
  end

  def set_destination
    @destination = SendDestination.find(params[:id])
  end

  def edit_validate
    if @destination.user_id != current_user.id
      redirect_to root_path
    end
  end
end
