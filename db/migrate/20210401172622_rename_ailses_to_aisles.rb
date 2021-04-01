class RenameAilsesToAisles < ActiveRecord::Migration[6.1]
  def change
    rename_table :ailses, :aisles
  end
end
