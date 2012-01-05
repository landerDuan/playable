class Ad < ActiveRecord::Base
	has_many :photos, :class_name => 'AdPhoto'
	accepts_nested_attributes_for :photos, :allow_destroy => true, :reject_if => :all_blank
	symbolize :position, :in => [:home, :product], :methods => true
end
