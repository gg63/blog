class PostsController < ApplicationController
    before_action :redirect_unlogin_user
    before_action :find_post, only:[:show, :edit, :update, :destroy]

    
    def index
         @posts = Post.all.order(created_at: :desc)
    end 
    
    def show
      
    end
    
    def new
        return redirect_to new_profile_path, alert: "プロフィールの登録をしてください" if current_user.profile.blank? 
        @post = Post.new
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
            redirect_to root_path, notice: "投稿を更新しました"
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
        params.require(:post).permit(:content, images: []).tap do |v|v[:user_id] = session[:user_id]
    end
    end
    
    private
    
    def find_post
        @post = Post.where(user_id: session[:user_id]).find(params[:id])
        @user = User.find(@post.user_id)
    end
end
