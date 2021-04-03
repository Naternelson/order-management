class Organization::DashboardController < ApplicationController
    before_action :redirect_if_not_admin
    def index 
        set_users
    end

    def create
        user = User.find_by_email params[:organization_user][:email]
        if user 
            org_user = OrganizationUser.new(user_id: user.id, organization_id: current_org.id)
            org_user.role = params[:organization_user][:role] ? params[:organization_user][:role] : "viewer" 
            org_user.save
        else  
            flash[:errors] = ["Couldn't find user with email: #{params[:organization_user][:email]}"]
        end
        redirect_to organization_root_path current_org
    end

    private 

    def redirect_if_not_admin
        redirect_to organization_orders_path(current_org) unless is_admin?
    end

    def set_users 
        @users = current_org.organization_users.select {|u| u.user_id != current_user.id}
    end
end