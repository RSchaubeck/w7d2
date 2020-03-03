class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user
            login_user!(user)
            redirect_to bands_url
        else
            flash.now[:errors] = ["Invalid username or passqord!"]
            render :new
        end
    end

    def destroy
        logout_user
        redirect_to new_session_url
    end


end
