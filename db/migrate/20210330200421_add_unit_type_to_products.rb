class AddUnitTypeToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :unit_type, :string
  end
end
