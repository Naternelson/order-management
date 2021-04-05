class UsersController < ApplicationController
    before_action :set_user
    layout 'general'
    def new 
    end

    def create 
        @user = User.new user_params 
        if @user.save
            session[:user_id] = @user.id
            redirect_to :root
        else
            flash[:errors] = @user.errors.full_messages
            render :new 
        end
    end

    private 

    def set_user
        @user = params[:id] ? User.find_by( id: params[:id] ): User.new
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :birthdate, :preferred_name, :email, :password, :password_confirmation)
    end
end