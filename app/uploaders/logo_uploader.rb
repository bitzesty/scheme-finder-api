class LogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    File.join(Rails.root, 'public', 'backend', 'uploads')
  end

  version :logo do
    process resize_to_fill: [50, 50]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  def default_url
    ActionController::Base.helpers.asset_path(
      "fallback/logo_default.png"
    )
  end
end
