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

    def update 
        @product = Product.find_by params[:id]
        @product.update(product_params)
        if @product.save
            redirect_to product_path(@product)
        else
            @errors = @product.errors.full_messages
            render :edit
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

    def set_product
        @product = params[:id] ? Product.find(params[:id]) : Product.new
    end
end
