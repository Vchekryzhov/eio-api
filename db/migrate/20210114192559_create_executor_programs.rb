class CreateExecutorPrograms < ActiveRecord::Migration[6.0]
  def change
    create_table "mdc.executor_programs" do |t|
      t.string :barcode_tech_process
      t.integer :rownum_tech_process
      t.references :employee
      t.float :actual_machine_time
      t.timestamps
    end
  end
end
