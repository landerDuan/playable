class Post < ActiveRecord::Base
	# validates :name, :presence => true, :uniqueness => true

	has_many :comments
	belongs_to :category
	belongs_to :user
end
