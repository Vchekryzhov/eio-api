class AddGroupTypea < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :group_type, :string
  end
end
