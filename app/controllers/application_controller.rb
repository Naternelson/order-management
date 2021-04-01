class ApplicationController < ActionController::Base
    
    def root 
        render layout: 'general'
    end


    private

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
