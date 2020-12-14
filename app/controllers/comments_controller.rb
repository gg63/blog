class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
    
  def create
    @post = post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end