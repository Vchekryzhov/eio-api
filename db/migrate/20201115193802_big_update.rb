class BigUpdate < ActiveRecord::Migration[6.0]
  def change
    remove_reference :devices, :node
    create_table :device_nodes do |t|
      t.references :node
      t.references :device
      t.timestamps
    end
  end
end
