module OrdersHelper

    def new_product_link(order)
        order.id ? new_order_product_path(@order) : new_product_path 
    end

    def product_units(order_item)
        amount = number_with_precision(order_item.amount, :precision => 0, :delimiter => ',')
        pluralize(amount, order_item.product.unit_type)
    end

    def time_remaining(order)
        due_date = order.due_by
        if due_date
            days_remaining =  (due_date - DateTime.now) / 86400
            if days_remaining > 1 
                "#{pluralize(days_remaining.to_i, "Day")} Remaining"
            elsif days_remaining.between?(0,1)
                "#{pluralize(days_remaining.to_i * 24, "Hour")} Remaining"
            else
                overdue = days_remaining < -1 ? pluralize(days_remaining.to_i * -1, "Day") : pluralize(days_remaining.to_i * -24, "Hour")
                overdue += " Overdue!"
            end
        end
    end

    def form_url(order)
        order.id ? organization_order_path(current_org, order) : organization_orders_path(current_org)
    end
    
end
