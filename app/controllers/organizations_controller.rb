class OrganizationsController < ApplicationController
    def new 
        @organization = Organization.new
        render layout: 'general'
    end

    def create 

    end
end