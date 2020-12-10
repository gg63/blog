class LikesController < ApplicationController
    
    def index
        @like_posts = ccurrent_user.like_posts
    end
    
    def create
        @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
        @likes = Like.where(post_id: params[:post_id])
        @posts = Post.all
    end
    
    def destroy
        like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
        like.destroy
        @posts = Post.all
    end
    
    
end
