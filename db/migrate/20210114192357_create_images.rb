class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table "mdc.images" do |t|
      t.string :path
      t.timestamps
    end
  end
end
