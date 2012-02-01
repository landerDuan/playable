class ProductPhoto < ActiveRecord::Base
  mount_uploader :photo, ProductPhotoUploader
  
  belongs_to :product, :counter_cache => 'photos_count'
  
end
# == Schema Information
#
# Table name: product_photos
#
#  id         :integer         not null, primary key
#  product_id :integer
#  photo      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

