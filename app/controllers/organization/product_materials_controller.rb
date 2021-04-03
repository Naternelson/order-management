class Organization::ProductMaterialsController < ApplicationController
    def destroy
        @product_material = ProductMaterial.find_by id: params[:id]
        @product = @product_material.product 
        @product_material.destroy
        redirect_to product_path @product
    end
end