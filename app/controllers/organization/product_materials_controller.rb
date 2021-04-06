class Organization::ProductMaterialsController < ApplicationController
    def destroy
        @product_material = ProductMaterial.find_by id: params[:id]
        @product = @product_material.product 
        @product_material.destroy
        flash[:notice] = ["Item Removed"]
        redirect_to organization_product_path current_org, @product
    end
end