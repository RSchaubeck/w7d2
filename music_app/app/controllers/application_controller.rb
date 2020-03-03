class ApplicationController < ActionController::Base

    helper_method :logged_in?, :current_user, :auth_token

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def  logged_in?
        !!current_user
    end

    def login_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout_user
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end

    def auth_token
        "<input
          type=\"hidden\"
          name=\"authenticity_token\"
          value=\"#{form_authenticity_token}\"
        />".html_safe
      end

end
