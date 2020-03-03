class UsersController < ApplicationController

    def new
        render :new
    end

    def show
        user = User.find(params[:id])
        render json: user 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login_user!(@user)
            redirect_to bands_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end