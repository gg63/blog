class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenicate(params[:password])
      ssesion[:user_id] = user.id
      redirect_to user_path, notice: "認証確認ログインしました"
    else
      flash.now[:alert] = "emailまたはpasswordが違います"
      render :new
    end
  end
end
