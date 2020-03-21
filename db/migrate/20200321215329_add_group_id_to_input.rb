class AddGroupIdToInput < ActiveRecord::Migration[6.0]
  def change
    add_reference :inputs, :group
  end
end
