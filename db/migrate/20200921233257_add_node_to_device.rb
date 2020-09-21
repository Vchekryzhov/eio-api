class AddNodeToDevice < ActiveRecord::Migration[6.0]
  def change
    add_reference :devices, :node
  end
end
