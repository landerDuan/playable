class AdPhoto < ActiveRecord::Base
	mount_uploader :photo, AdPhotoUploader
  
  belongs_to :ad
end
