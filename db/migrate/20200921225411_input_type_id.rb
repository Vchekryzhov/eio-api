class InputTypeId < ActiveRecord::Migration[6.0]
  def change
    add_reference :inputs, :input_type
  end
end
