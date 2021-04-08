module ProductsHelper

    def full_dimensions(product)
        string = ""
        %i[length width height].each do |d|
            value = product.send(d).to_s
            unless value.nil? || value == 0.to_s
                if string.empty?
                    string = value 
                else
                    string << " x #{value}"
                end
            end
        end
        "#{string} #{pluralize(2, product.dimension_unit_type)}" unless string.empty?
    end

    def new_product_form_path(order=nil)
        order ? link_to("Add product",  new_organization_order_product_path(current_org, order)) : link_to("New Product", new_organization_product_path(current_org))
    end

end
