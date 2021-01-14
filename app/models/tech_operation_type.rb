class TechOperationType < ApplicationRecord
  def self.table_name_prefix
    'mdc.'
  end
end
