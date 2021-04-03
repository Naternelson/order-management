module SessionHelper

    def logout_route
        params[:org_slug] ? organization_logout_path : logout_path
    end


end
