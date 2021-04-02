def UsersController < ApplicationController
    def new 

    end

    private 

    def set_user
        @user = params[:id] ? User.find_by id: params[:id] : User.new
    end
end