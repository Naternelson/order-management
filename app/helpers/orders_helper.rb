module OrdersHelper

    def new_product_link(order)
        order.id ? new_order_product_path(@order) : new_product_path 
    end
end
