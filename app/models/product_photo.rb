class ProductPhoto < ActiveRecord::Base
  mount_uploader :photo, ProductPhotoUploader
  
  belongs_to :product
  
end
