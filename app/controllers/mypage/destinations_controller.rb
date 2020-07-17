class Mypage::DestinationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_destination
  before_action :edit_validate
  
  def edit
  end

  def update
    binding.pry
    if @destination.update(destination_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  private
  def destination_params
    params.require(:send_destination).permit(:nickname, :email)
  end

  def set_destination
    @destination = SendDestination.find(params[:id])
  end

  def edit_validate
    if @destinationuser_id != current_user.id
      redirect_to root_path
    end
  end
end
