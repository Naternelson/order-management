class ApplicationController < ActionController::Base
    
    

    helper_method :current_user, :current_org


    def current_user 
        @user = session[:user_id] ? User.find_by(id: session[:user_id]) : nil
    end

    def current_org 
        @organization = params[:org_slug] ? Organization.find_by_slug(params[:org_slug]) : nil
    end

    def logged_in?
        !!current_user
    end

    def logged_out?
        !current_user
    end
    
end
