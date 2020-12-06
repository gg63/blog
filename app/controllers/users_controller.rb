class UsersController < ApplicationController
  before_action :redirect_loggedin_user, only: [:new, :create]
  before_action :redirect_unlogin_user, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_profile_path, notice: "サインインしました"
    else
      render :new
    end
  end

  def show
    
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  
end
