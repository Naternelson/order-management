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


end
