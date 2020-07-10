class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :logout]

  def index
  end

  def mypage
  end

  def logout
  end
end
