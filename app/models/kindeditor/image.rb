class Kindeditor::Image < Kindeditor::Asset
  mount_uploader :asset, Kindeditor::ImageUploader
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

