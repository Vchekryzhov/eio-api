class CreateHub2devices < ActiveRecord::Migration[6.0]
  def change
    create_table :hub2devices do |t|
      t.references :hub, type: :string
      t.references :device
      t.timestamps
    end
  end
end
