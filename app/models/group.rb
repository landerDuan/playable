class Group < ActiveRecord::Base

	validates :name,:code, :presence => true, :uniqueness => true
	validates :roles, :presence => true

	has_and_belongs_to_many :users
	has_and_belongs_to_many :roles
	
	scope :default_order, order('id DESC')

end
# == Schema Information
#
# Table name: groups
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  code        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

