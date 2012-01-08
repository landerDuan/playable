class Ad < ActiveRecord::Base
  mount_uploader :photo, AdPhotoUploader
  
  validates :title, :photo,  :presence => true

  symbolize :position, :in => [:home, :product], :scopes => true

  has_many :photos, :class_name => 'AdPhoto'

end
# == Schema Information
#
# Table name: ads
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  url        :string(255)
#  photo      :string(255)
#  position   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

