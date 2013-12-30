class LogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def extension_white_list
    %w(jpg jpeg png)
  end

  def default_url
    ActionController::Base.helpers.asset_path(
      "fallback/" + [version_name, "default.png"].compact.join('_')
    )
  end
end
