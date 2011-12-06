class Role < ActiveRecord::Base

	validates :name,:code, :presence => true, :uniqueness => true

	has_and_belongs_to_many :groups

end
# == Schema Information
#
# Table name: roles
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  code        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

