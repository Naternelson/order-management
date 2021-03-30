module ProductssHelper

    def product_name(units, product)
        pluralize(units, product.name)
    end


end
