class RenameTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :hub2configs, :hub_configs
  end
end
