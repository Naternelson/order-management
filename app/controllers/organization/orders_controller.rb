class Organization::OrdersController < ApplicationController
  before_action :redirect_if_logged_out, :redirect_if_outsider
  before_action :set_order, only: %i[new show edit update destroy ]

  def index
    @orders = Order.for current_org
  end

  def show
    order = Order.find_by sales_order_id: params[:order][:sales_order_id] if params[:order]
    redirect_to order_path(order) if order
  end

  def new
    @products = Product.for current_org
    @order.received_on = Date.today.beginning_of_day
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.organization = current_org
    if @order.save
      redirect_to organization_products_path(current_org)
    else
      flash[:errors] = @order.errors.full_messages
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to organization_order_path(current_org, @order)
    else
      flash[:errors] = @order.errors.full_messages
      render :edit 
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = params[:id] ? Order.find(params[:id]) : Order.new
      empty_order_item
      empty_customer
    end

    def empty_order_item
      @order.order_items.build if @order.order_items.empty?
    end

    def empty_customer
      @order.customer = Customer.new unless @order.customer
    end

    def order_params
      params.require(:order).permit(
        :sales_order_id, :received_on, :due_by, :customer_name, :purchase_order_id, order_items_attributes: [:id, :product_id, :amount]
        )
    end
end
