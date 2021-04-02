module ApplicationHelper

    def google_button(text = "") 
        open_a = "<a href='/auth/google_oauth2' class='btn btn-sm btn-google btn-outline-dark' data-method='post' rel='nofollow'>".html_safe
        image = image_tag('https://img.icons8.com/color/16/000000/google-logo.png', class: "p-2")
        link = open_a << image << text.html_safe << "</a>".html_safe
    end

    def autocomplete(form_builder, collection_name, collection = [],  html_options = {})
        # This method will autogenerate a datalist input field for a form builder
        # Requirements:
            # Must be called with a form_builder, can't be called just for the form_tag
            # Needs a Collection, if no collection is provided it will be called on an empty array
            # Be sure to include a key, value pair for :list, in the html_options. If no list key is passed, 'ids' will be passed
            # Ensure that the value for :list is a string
            # Ensure that the value for :list is plural
        #Example
        # If the following method was called for the order form:
            # <%= form_for @order do |f| %>
                # autocomplete(f, "customer", Customer.all, {list: "names", class: "form-control"})
            # <% end %>

        # The html output would be 
            # <input list="customer_names", class="form-control", type="text", name= "order[customer_name]", id="order_customer_name">
            # <datalist id="customer_names">...options...</datalist>

        html_options[:list] ||= "ids"
        html_options[:list] = "#{collection_name}_#{html_options[:list]}"
        list_name = html_options[:list].to_s.singularize.to_sym

        form_field = form_builder.text_field(list_name, html_options)
        options_tag_array = collection.map {|c| "<option value='#{c.send(list_name).to_s}'></option>"}
        options = "<datalist id = '#{html_options[:list]}'> #{options_tag_array.join(" ")} </datalist>"

        form_field << options.html_safe
    end

    def form_control_default
        "form-control form-control-sm"
    end

    def form_group(form_builder, field_type, field_name, wrapper_html_options = {}, field_html_options = {})
        raise "Cannot create form group on #{field_type.to_s}." if field_type.to_s.split("_").last != "field"
        #meant for simple fields (i.e.  "_field" ); not for selects, checks, lists, or boxes

        wrapper_html_options[:class] ||= "form-group"
        field_html_options[:class] ||= form_control_default
        field_name_string = field_name.to_s.split("_").collect{|w| w.capitalize}.join(" ")

        field = form_builder.send field_type.to_sym, field_name, field_html_options
        label = form_builder.label field_name.to_sym, field_name_string

        wrapper_html = ""
        wrapper_html_options.each {|key, value| wrapper_html << "#{key.to_s}='#{value}' "}
        "<div #{wrapper_html}> #{label} #{field}</div>".html_safe
    end
end

