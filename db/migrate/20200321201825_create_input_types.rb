class CreateInputTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :input_types do |t|
      t.string :title
      t.string :description
      t.string :kind, index: {unique: true}, null: false, foreign_key: true
      t.timestamps
    end
    add_column :inputs, :input_type, :string, index: true
  end
end
