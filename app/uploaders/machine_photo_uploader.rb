class MachinePhotoUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  def url
    "https://cnc-api.kovalev.team" + super
  end
end
