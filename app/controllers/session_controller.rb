class SessionController < ApplicationController
    layout 'general'
    def new
        render :layout => 'general'
    end

    def create 
        binding.pry
        @user = User.find_by_email params[:email]
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to :root
        elsif @user 
            @errors = ["Incorrect Password"]
            render :new
        else
            @errors = ["Email '#{params[:email]}' not found"]
            render :new
        end
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