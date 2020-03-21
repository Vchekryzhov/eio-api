class CreateGroupTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :group_types do |t|
      t.string :title
      t.string :kind, index: {unique: true}, null: false, foreign_key: true
      t.timestamps
    end
  end
end
