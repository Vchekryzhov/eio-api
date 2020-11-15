class AddUnitToInputType < ActiveRecord::Migration[6.0]
  def change
    add_column :input_types, :unit, :string
  end
end
