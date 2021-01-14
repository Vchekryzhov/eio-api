class CreateTechOperationTypes < ActiveRecord::Migration[6.0]
  def change
    create_table "mdc.tech_operation_types" do |t|
      t.string :name
      t.timestamps
    end
  end
end
