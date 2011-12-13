class Kindeditor::Asset < ActiveRecord::Base
  
  validates_presence_of :asset
  before_save :update_asset_attributes
  
  private
  def update_asset_attributes
    self.file_size = asset.file.size
    self.file_type = asset.file.content_type
  end
  
end\n# == Schema Information
#
# Table name: assets
#
#  id         :integer         not null, primary key
#  asset      :string(255)
#  file_size  :integer
#  file_type  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

