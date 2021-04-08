class OrganizationsController < ApplicationController
    def new 
        @organization = Organization.new
        render layout: 'general'
    end

    def create 
        @organization = Organization.new organization_params
        if @organization.save
            @organization.organization_users.create(user: current_user, role: "admin")
            redirect_to root_path
        else
            flash[:errors] = @organization.errors.full_messages
            render :new, layout: 'general'
        end
    end

    private
    def organization_params
        params.require(:organization).permit(:name, :org_type, sites_attributes: [:id, :name, :address_line_1, :address_line_2, :city, :state, :zip, :alias])
    end
end