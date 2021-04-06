class UsersController < ApplicationController
    before_action :set_user
    layout 'general'
    def new 
    end

    def create 
        @user = User.new user_params(new_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = ["User succesfully created!", "Welcome #{@user.name}"]
            redirect_to :root
        else
            flash[:errors] = @user.errors.full_messages
            render :new 
        end
    end

    def update 
        if current_user.update(user_params(update_params))
            flash[:success] = ["User updated"]
            redirect_to root_path 
        else
            flash[:errors] = current_user.errors.full_messages
            render :edit 
        end

    end

    private 

    def set_user
        @user = params[:id] ? User.find_by( id: params[:id] ): User.new
    end

    def user_params(p)
        params.require(:user).permit(p)
    end

    def new_params
        [:first_name, :last_name, :birthdate, :preferred_name, :email, :password, :password_confirmation]
    end
    def update_params
        [:first_name, :last_name, :birthdate, :preferred_name]
    end
end