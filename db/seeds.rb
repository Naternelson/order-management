# @teddy_bear = Product.find_or_create_by({name: "Teddy Bear", description: "A Fully Completed Teddy Bear"})
# @stuffing = Product.find_or_create_by({name: "Stuffing", description: "Teddy Bear Stuffing"})
# @fur = Product.find_or_create_by({name: "Faux Bear Fur", description: "Teddy Bear Fur"})

@test_co = Organization.find_or_create_by name: "Corp. Testing", org_type: "Business"

@admin = User.find_or_initialize_by(first_name: "Nathan", last_name: "Nelson", preferred_name: "Nate", email: "7nater.nelson@gmail.com")
@fred = User.find_or_initialize_by(first_name: "Fred", last_name: "Weasley", email: "fred@company.com")
@george = User.find_or_initialize_by(first_name: "George", last_name: "Weasley", email: "george@company.com")
@voldy = User.find_or_initialize_by(first_name: "Thomas", last_name: "Riddle", preferred_name: "Voldemort",email: "tom@company.com")
@harry = User.find_or_initialize_by(first_name: "Harry", last_name: "Potter", email: "harry@company.com")

@test_co_users = [@admin, @fred, @george, @voldy, @harry].each do |user|
    user.password = "password"
    user.save
    role = user == @admin ? "admin" : "viewer"
    OrganizationUser.find_or_create_by ({organization_id: @test_co.id, user_id: user.id, role: role})
end

@pb = Product.find_or_create_by(name: "Peanut Butter", description: "Jiffy Brand", color: "brown", organization_id: @test_co.id)
@jelly = Product.find_or_create_by(name: "Jelly", description: "Smuckers", color: "purple", organization_id: @test_co.id)
@bread = Product.find_or_create_by(name: "Bread", description: "Whole Wheat", color: "white", unit_type: "slice", organization_id: @test_co.id)
@sandwich = Product.find_or_create_by(name: "PB&J Sandwich", description: "Yummy!", organization_id: @test_co.id)

[@pb, @jelly, @bread].each do |m|
    amount = m == @bread ? 2 : 1 
    ProductMaterial.find_or_create_by product_id: @sandwich.id, material_id: m.id, amount: amount
end

@hungry_hippo = Customer.find_or_create_by name: "Hungry Hippo"
@timmy = Customer.find_or_create_by name: "Timmy"
@billy = Customer.find_or_create_by name: "Billy"
@joe = Customer.find_or_create_by name: "Joe"

i = 123
[@hungry_hippo, @timmy, @billy, @joe].each do |c|
    amount = c == @hungry_hippo ? 1000 : 2
    order = Order.find_or_create_by sales_order_id: "SO#{i}", purchase_order_id: "PO#{i}", customer_id: c.id, organization_id: @test_co.id
    OrderItem.find_or_create_by product_id: @sandwich.id, order_id: order.id, amount: amount 
    i += 1
end

