class Request < ApplicationRecord

  after_create :create_inputs
  def create_inputs
    request["inputs"].map do |i|
        Input.create(
          device_id: i['device_id'],
          input_type: i['input_type'],
          group_id: i['group_id'],
          value: i['value'] || i['values'],
          client_time: created_at,
          name: i['name'],
          request_id: id
        )
    end if request["inputs"].present?
  end
end
