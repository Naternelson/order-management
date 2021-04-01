class ProductsController < ApplicationController
    before_action :set_product, only: %i[new show edit update destroy ]

    def index 
        @products = Product.all
    end

    def new
    end

    def create
        @product = Product.new product_params
        if @product.save 
            redirect_to product_path(@product)
        else
            @errors = @product.errors.full_messages
            render :new
        end
    end

    def show 
        @blank_product_material = @product.product_materials.build
        @current_materials = @product.product_materials.select {|m| !m.id.nil?} 
    end

    def update 
        if params[:product_material]
            join = ProductMaterial.new(product_material_params)
            join.product_id = params[:id]
            join.save
            @errors = join.errors.full_messages if join.errors
            @blank_product_material = @product.product_materials.build
            @current_materials = @product.product_materials.select {|m| !m.id.nil?} 
            render :show  
        else
            @product = Product.find_by params[:id]
            @product.update(product_params)
            if @product.save
                redirect_to product_path(@product)
            else
                @errors = @product.errors.full_messages
                render :edit
            end
        end
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
        @product = params[:id] ? Product.find(params[:id]) : Product.new
    end
end
