# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate


# The Plan
This project will create an ordermanagement system for companies to manage incoming and outgoing orders, plan and build products, communicate interally and externally to employees, supplier, vendors and customers and ensure quality throughout the entire business lifecycle.

This git will build this piece by piece through several phases:
- [Phase 1 Basic Orders](#phase-1-basic-orders)
- [Phase 2 Product Locations](#phase-2)

## Phase 1 Basic Orders
Here we will set up the basic layout and models for creating an order.
### Models
Models relating to basic order management
#### Order
```sh
has_many :order_items
has_many :products, through: :order_items
```
#### OrderItem
```sh
belongs_to :product
belongs_to :order
```
#### Product
```sh
has_many :order_items
has_many :orders, through: order_items
has_many :product_materials
has_many :products, through: :product_materials
has_many :materials, through: :product_materials, foreign_key: :material_id
```
#### ProductMaterials
```sh
belongs_to :product
belongs_to :material, class_name: :product
```
### Views
Basic orders should include all aspects of CRUD
- New
-- Create New Order
-- Find or Create a Product
- Show
-- View Product Details 
-- Change Order Status
-- View Order Details
- Edit
-- Edit only Order Information
- Index
-- View Aggrate Data
-- Filter Orders
-- See a List of Orders