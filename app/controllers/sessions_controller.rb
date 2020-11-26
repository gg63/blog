class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenicate(params[:password])
      ssesions[:user_id] = user.id
      redirect_to user_path
  end
end
