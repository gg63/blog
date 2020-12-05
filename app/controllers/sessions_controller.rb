class SessionsController < ApplicationController
  before_action :redirect_loggedin_user,except: :destroy
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path, notice: "ログインしました"
    else
      flash.now[:alert] = "emailまたはpasswordが違います"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました"
  end
  
end
