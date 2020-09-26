class Request < ApplicationRecord

  after_create :create_inputs
  def create_inputs
    request["inputs"].map do |i|
        Input.create!(
          device_id: request['device_id'],
          input_type: i['name'],
          group_id: i['group_id'],
          value: i['value'] || i['values'],
          client_time: i['timestamp'],
          name: i['name'],
          request_id: id
        )
    end if request["inputs"].present?
  end
end
