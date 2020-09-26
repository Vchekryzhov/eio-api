class AddUnitToInput < ActiveRecord::Migration[6.0]
  def change
    add_column :inputs, :unit, :string
  end
end
