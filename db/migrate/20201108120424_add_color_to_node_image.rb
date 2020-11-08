class AddColorToNodeImage < ActiveRecord::Migration[6.0]
  def change
    add_column :nodes, :image_color, :string
  end
end
