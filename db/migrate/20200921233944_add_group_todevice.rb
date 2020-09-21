class AddGroupTodevice < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :device
  end
end
