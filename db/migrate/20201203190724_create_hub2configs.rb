class CreateHub2configs < ActiveRecord::Migration[6.0]
  def change
    create_table :hub2configs do |t|
      t.references :hub, type: :string
      t.jsonb :config
      t.timestamps
    end
  end
end
