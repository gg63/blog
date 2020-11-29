class PostsController < ApplicationController
    
    before_action :find_post, only:[:show, :edit, :update, :destroy]
    
    def index
        @posts = Post.all
    end 
    
    def show
        
    end
    
    def edit
        
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path, notice: "投稿しました"
        else
            render :new
        end
    end
    
    def update
        if @post.update(post.params)
            redirect_to root_path, notice: "更新しました"
        else
            render :edit
        end
    end
    
    def destroy
        if @post.destroy
            redirect_to root_path, notice: "削除しました"
        else
            redirect_to root_path, alert: "削除できませんでした"
        end
    end
    
    def post_params
        params.require(:post).parmit(:content)
    end
    
    private
    
    def find_post
        @post = Post.find(params[:id])
    end
end
