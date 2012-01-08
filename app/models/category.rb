class Category < ActiveRecord::Base
  
  attr_readonly :posts_count
  
  validates :code, :name, :presence => true, :uniqueness => true
  
	has_many :posts
	
end
# == Schema Information
#
# Table name: categories
#
#  id          :integer         not null, primary key
#  code        :integer
#  name        :string(255)
#  posts_count :integer         default(0)
#  created_at  :datetime
#  updated_at  :datetime
#

