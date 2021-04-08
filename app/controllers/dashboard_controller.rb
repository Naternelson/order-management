class DashboardController < ApplicationController
    # before_action :current_user
    
    layout 'dashboard'
    
    def index
        if logged_in?
            render 'entry'
        else
            render 'home', layout: 'general'
        end
    end
    
end