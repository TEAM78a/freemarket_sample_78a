class CommentsController < ApplicationController
  def create
    comment = Comment.create(params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id]))
    redirect_to product_path
  end

  private

  def comment_params
    
  end
end
