# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    if model.respond_to?(:email) and model.email.present?
      Gravatar.gravatar_url(model.email, :size => "50x50")
    end
  end

  version :thumb do
    process :resize_to_fill => [50, 50]
  end

  # Restrict uploads to images only
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
