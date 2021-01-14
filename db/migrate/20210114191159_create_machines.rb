class CreateMachines < ActiveRecord::Migration[6.0]
  def change
    ActiveRecord::Base.connection.create_schema('mdc')
    create_table "mdc.machines" do |t|
      t.string :name
      t.string :description
      t.string :barcode
      t.timestamps
    end
  end
end
