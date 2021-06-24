class ApplicationController < ActionController::Base
    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def log_in_user(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end
end
