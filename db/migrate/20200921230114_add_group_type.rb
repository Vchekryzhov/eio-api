class AddGroupType < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :group_type
  end
end
