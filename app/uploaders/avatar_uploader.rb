# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [500, 500]

  version :thumb do
    process :resize_to_fill => [42, 42]
  end

  version :profile do
    process :resize_to_fill => [140, 140]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url(*args)
    "/img/" + [version_name, "user.png"].compact.join('_')
  end

end
