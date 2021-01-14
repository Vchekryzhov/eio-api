class CreateTechOperations < ActiveRecord::Migration[6.0]
  def change
    create_table "mdc.tech_operations" do |t|
      t.string :name
      t.references :tech_operation_type
      t.float :scheduled_machine_time
      t.timestamps
    end
  end
end
