class CreateProductMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :product_materials do |t|
      t.integer :product_id
      t.integer :material_id
      t.float :amount
      t.string :amount_unit_type
      t.string :level

      t.timestamps
    end
  end
end
