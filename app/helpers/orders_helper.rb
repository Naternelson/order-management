module OrdersHelper

    def new_product_link(order)
        order.id ? new_order_product_path(@order) : new_product_path 
    end

    def product_units(order_item)
        pluralize(order_item.amount, order_item.product.unit_type)
    end


end
