class UsersController < ApplicationController
    def new 
        render layout: "general"
    end

    private 

    def set_user
        @user = params[:id] ? User.find_by( id: params[:id] ): User.new
    end
end