class CommentsController < ApplicationController
  def create
    Comment.create(params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id]))
  end

  private

  def comment_params
    
  end
end
