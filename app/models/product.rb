class Product < ActiveRecord::Base
	has_many :photos, :class_name => 'ProductPhoto'
	accepts_nested_attributes_for :photos, :allow_destroy => true, :reject_if => :all_blank
end
