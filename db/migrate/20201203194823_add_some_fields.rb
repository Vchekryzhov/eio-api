class AddSomeFields < ActiveRecord::Migration[6.0]
  def change
    add_column :hub_configs, :config_hash_crc32, :string
    add_column :hubs, :device_list_available, :jsonb
  end
end
