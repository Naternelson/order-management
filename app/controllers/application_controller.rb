class ApplicationController < ActionController::Base
    
    def root 
        render layout: 'general'
    end



    private

    def current_user 
        @user = User.find_by id: session[:user_id]
    end


    def choose_layout
        if current_user.admin?
            “admin”
        elseif current_user.user?
            “viewer”
        else
            “application”
        end
    end

    
end
