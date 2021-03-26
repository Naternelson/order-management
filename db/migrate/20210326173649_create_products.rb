class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :color
      t.float :length
      t.float :width
      t.float :height
      t.string :dimension_unit_type
      t.float :weight
      t.string :weight_unit_type

      t.timestamps
    end
  end
end
