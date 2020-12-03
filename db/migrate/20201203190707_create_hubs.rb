class CreateHubs < ActiveRecord::Migration[6.0]
  def change
    create_table :hubs, id: :string do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :v_ver
      t.timestamps
    end
  end
end
