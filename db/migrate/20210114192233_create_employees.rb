class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table "mdc.employees" do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :position
      t.timestamps
    end
  end
end
