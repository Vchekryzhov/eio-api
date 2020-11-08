class MachinePhotoUploader < BaseUploader
  include CarrierWave::MiniMagick

  storage :file
  version :regular do
    process resize_to_limit: [200, 200]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
