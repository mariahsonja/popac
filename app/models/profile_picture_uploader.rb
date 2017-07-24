class ProfilePictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  
  process :tags => ["profile_picture"]
  process :convert => "jpg"

  version :thumbnail do
    eager
    resize_to_fit(150, 150)
    cloudinary_transformation :quality => 80          
  end  
end