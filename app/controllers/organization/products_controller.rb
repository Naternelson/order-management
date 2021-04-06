class Organization::ProductsController < ApplicationController
    before_action :redirect_if_logged_out
    before_action :redirect_if_outsider
    before_action :set_product, only: %i[new show edit update destroy ]

    def index 
        @products = Product.for current_org
    end

    def new
    end

    def create
        @product = Product.new product_params
        @product.organization = current_org
        if @product.save 
            flash[:success] = [@product.name << " saved"]
            redirect_to organization_product_path(current_org, @product)
        else
            flash[:errors] = @product.errors.full_messages
            render :new
        end
    end

    def show 
        return redirect_to organization_products_path(current_org) if @product.nil?
        @blank_product_material = @product.product_materials.build
        @current_materials = @product.product_materials.select {|m| !m.id.nil?} 
    end

    def update 
        if params[:product_material]
            join = ProductMaterial.new(product_material_params)
            join.product_id = params[:id]
            join.save
            flash[:errors] = join.errors.full_messages if join.errors
            @blank_product_material = @product.product_materials.build
            @current_materials = @product.product_materials.select {|m| !m.id.nil?} 
            render :show  
        else
            @product = Product.find_by params[:id]
            @product.update(product_params)
            if @product.save
                flash[:success] = [@product.name << " updated"]
                redirect_to organization_product_path(current_org, @product)
            else
                flash[:errors] = @product.errors.full_messages
                render :edit
            end
        end
    end

    def destroy
        @product.product_materials.each {|m| m.destroy}
        @product.material_products.each {|m| m.destroy}
        @product.destroy
        redirect_to organization_products_path(current_org)
    end

    private

    def product_params
        params.require(:product).permit(
            :name, :description, :color,
            :height, :width, :length, 
            :dimension_unit_type, :weight,
            :weight_unit_type, :unit_type
        )
    end

    def product_material_params
        params.require(:product_material).permit(:material_id, :amount)
    end

    def set_product
        @product = params[:id] ? Product.find_by_id(params[:id]) : Product.new
    end
end
