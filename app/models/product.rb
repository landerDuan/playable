class Product < ActiveRecord::Base
	has_many :photos, :class_name => 'ProductPhoto'
	accepts_nested_attributes_for :photos, :allow_destroy => true, :reject_if => :all_blank
end
# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  url         :string(255)
#  description :text
#  priority    :integer         default(0)
#  created_at  :datetime
#  updated_at  :datetime
#

