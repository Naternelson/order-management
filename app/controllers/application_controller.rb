class ApplicationController < ActionController::Base
    
    helper_method :current_user, :current_org


    def current_user 
        @user = session[:user_id] ? User.find_by(id: session[:user_id]) : nil
    end

    def current_org 
        id = params[:org_slug].split("-").first if params[:org_slug] 
        if id
            @organization = Organization.find_by_id id.to_i
            @organization = Organization.find_by_slug params[:org_slug] unless @organization
            @organization 
        end
    end

    def logged_in?
        !!current_user
    end

    def logged_out?
        !current_user
    end

    def related_user?
        current_org.users.include?(current_user)
    end

    def is_admin?
        user_relationship = current_org.organization_users.find {|r| r.user == current_user}
        user_relationship.role == "admin" if user_relationship
    end

    def redirect_if_logged_out
        redirect_to root_path if logged_out?
    end

    def redirect_if_outsider
        redirect_to root_path unless related_user?
    end
    
end
