class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
    
    def create
      @post = Post.find(params[:post_id])
      @comment = current_user.comments.new(comment_params)
      if @comment.save
        flash[:success] = "コメントしました"
        redirect_to request.referer
      else
        @post_new = Post.new
        @comments = @post.comments
        flash[:success] = "コメントできませんでした"
        redirect_to new_post_path
      end
    end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end