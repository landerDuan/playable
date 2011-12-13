class Post < ActiveRecord::Base
	# validates :name, :presence => true, :uniqueness => true

	has_many :comments
	belongs_to :category
	belongs_to :user
end
# == Schema Information
#
# Table name: posts
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  title       :string(255)
#  content     :text
#  permalink   :string(255)
#  is_top      :boolean
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

