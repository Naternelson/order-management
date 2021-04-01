class SessionController < ApplicationController
    
    def new
    end

    def create 
        @user = User.find_by_email params[:email]
        
    end

    def destroy
    end

    def omniauth 
        @user = User.from_omniauth(auth)
        @user.save 
        session[:user_id] = @user.id 
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end