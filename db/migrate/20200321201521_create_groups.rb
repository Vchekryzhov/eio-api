class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :inputs, :group_input_id, :integer
    create_table :groups do |t|
      t.string :title
      t.references :parent
      t.string :group_type, index: true, foreign_key: true
      t.timestamps
    end
  end
end
