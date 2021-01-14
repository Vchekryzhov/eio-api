class CreateTechProcesses < ActiveRecord::Migration[6.0]
  def change
    create_table "mdc.tech_processes" do |t|
      t.string :barcode
      t.references :tech_operation
      t.integer :rownum
      t.timestamps
    end
  end
end
