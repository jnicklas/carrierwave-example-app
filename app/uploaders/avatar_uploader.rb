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

  version :with_mirror do
    process :resize_to_fill => [200, 200]
    process :add_mirror_effect => 0.2
  end

  # Restrict uploads to images only
  def extension_white_list
    %w(jpg jpeg gif png)
  end

private

  def add_mirror_effect(mirror_length)
    manipulate! do |img|
      mirror_rows = img.rows * mirror_length

      gradient = Magick::GradientFill.new(0, 0, mirror_rows, 0, "#888", "#000")
      gradient = Magick::Image.new(img.columns, mirror_rows, gradient)
      gradient.matte = false

      flipped = img.flip
      flipped.matte = true
      flipped.composite!(gradient, 0, 0, Magick::CopyOpacityCompositeOp)

      new_frame = Magick::Image.new(img.columns, img.rows + mirror_rows)
      new_frame.composite!(img, 0, 0, Magick::OverCompositeOp)
      new_frame.composite!(flipped, 0, img.rows, Magick::OverCompositeOp)
    end
  end

end
