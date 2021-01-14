class CreateDraft2images < ActiveRecord::Migration[6.0]
  def change
    create_table "mdc.draft2images" do |t|
      t.references :draft
      t.references :image
      t.integer :rownum
      t.timestamps
    end
  end
end
