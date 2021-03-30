class OrdersController < ApplicationController
  before_action :set_order, only: %i[new show edit update destroy ]
  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    order = Order.find_by sales_order_id: params[:order][:sales_order_id] if params[:order]
    redirect_to order_path(order) if order
  end

  # GET /orders/new
  def new
    @products = Product.all 
    @order.received_on = Date.today.beginning_of_day
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    binding.pry
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
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

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(
        :sales_order_id, :received_on, :due_date, :customer_name, :purchase_order_id, order_items_attributes: [:id, :product_id, :amount]
        )
    end
end
