class Node < ApplicationRecord
    mount_uploader :image, MachinePhotoUploader

    has_many :node2depart
    has_many :departments, through: :node2depart, source: :department
    has_many :device_nodes
    has_many :devices, through: :device_nodes

    after_commit :set_image_color

    def set_image_color
      image.present? ? image.regular.set_color : nil
    end

    def last_online
      Time.parse(Redis.new(db: 1).get(id)) if Redis.new(db: 1).get(id)
    end

    def online?
      Redis.new(db: 1).get(id) && Time.parse(Redis.new(db: 1).get(id)) > Time.current - 3.seconds
    end
end
