class ApplicationController < ActionController::Base
    helper_method :current_user
    
    def redirect_unlogin_user
        if current_user.nil?
            redirect_to login_path, alert: "ログインする必要があります"
        end
    end
    
    def redirect_loggedin_user
        if current_user.present?
            redirect_to posts_path, notice: "あなたは既にログイン済みです"
        end
    end
    
    def current_user
        if session[:user_id]
            current_user ||= User.find(session[:user_id])
        end 
    end
end
