class CreateDrafts < ActiveRecord::Migration[6.0]
  def change
    create_table "mdc.drafts" do |t|
      t.string :name
      t.string :barcode
      t.timestamps
    end
  end
end
